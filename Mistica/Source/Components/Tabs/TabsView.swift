//
//  TabsView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

/// The TabsViewDelegate protocol defines methods that allow you to manage the selection and deselection of
/// segments in a `TabsView`. The methods of this protocol are all optional.
public protocol TabsViewDelegate: AnyObject {
    func tabsView(_ tabsView: TabsView, didSelectTab tab: TabItem)
}

public class TabsView: UIView {
    private enum Constants {
        static let dividerHeight: CGFloat = 1
        static let componentHeight: CGFloat = 56
        static let estimatedItemSize = CGSize(width: 100, height: Constants.componentHeight)
        static let firstIndexPath = IndexPath(row: 0, section: 0)
        static let maximuItemWithFixSize = 3
        static let minimumWidthForIpad: CGFloat = 768
        static let maximumWidthItem: CGFloat = 280
    }

    private lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = false
        collectionView.alwaysBounceVertical = false
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.delegate = self
        TabItemViewCell.registerClassForCell(to: collectionView)

        return collectionView
    }()

    // Layout is initialized to a default UICollectionViewFlowLayout. It will be overriden during set up phase.
    private lazy var layout: UICollectionViewFlowLayout = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: Constants.maximumWidthItem, height: Constants.componentHeight)
        layout.minimumInteritemSpacing = 0
        return layout
    }()

    private lazy var divider: UIView = {
        let divider = UIView()
        divider.backgroundColor = .divider
        return divider
    }()

    private var firstIndexPathForSelectedItem: IndexPath?

    private var tabsItems: [TabItem] = []

    public weak var delegate: TabsViewDelegate?

    public init(tabItems: [TabItem]) {
        tabsItems = tabItems

        super.init(frame: .zero)

        commomInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        commomInit()
    }
}

// MARK: - Public

public extension TabsView {
    func reload(with tabsItems: [TabItem]) {
        self.tabsItems = tabsItems
        reloadContent()
        guard let firstTabItem = tabsItems.first else { return }
        delegate?.tabsView(self, didSelectTab: firstTabItem)
    }

    func update(_ tabItem: TabItem, at index: Int) {
        tabsItems[index] = tabItem
        let indexPath = IndexPath(item: index, section: 0)

        collectionView.performBatchUpdates {
            collectionView.reloadItems(at: [indexPath])
        }
    }

    func remove(_ index: Int) {
        guard index < tabsItems.count else {
            fatalError("The index (\(index) and number of elements (\(tabsItems.count) don't match. ")
        }
        tabsItems.remove(at: index)
        collectionView.performBatchUpdates {
            let indexPath = IndexPath(item: index, section: 0)
            collectionView.deleteItems(at: [indexPath])
        } completion: { _ in
            self.deselectTabItem(at: index)
            self.selectTabItem(at: max(0, index - 1))
        }
    }
}

// MARK: - Private

private extension TabsView {
    func commomInit() {
        setUpView()
        setUpDivider()
        setUpCollectionView()
        updateEstimatedItemSize()

        // Listen to theme variant changes
        NotificationCenter.default.addObserver(self, selector: #selector(themeDidChange), name: .themeVariantDidChange, object: nil)
    }

    func setUpView() {
        backgroundColor = .background
    }

    func setUpDivider() {
        addSubview(divider, constraints: [
            divider.bottomAnchor.constraint(equalTo: bottomAnchor),
            divider.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: Constants.dividerHeight)
        ])
    }

    func setUpCollectionView() {
        addSubview(collectionView, constraints: [
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: divider.topAnchor, constant: Constants.dividerHeight),
            collectionView.heightAnchor.constraint(equalToConstant: Constants.componentHeight),
            heightAnchor.constraint(equalToConstant: Constants.componentHeight)
        ])
    }

    func selectTabItem(at row: Int) {
        let indexPath = IndexPath(item: row, section: 0)
        firstIndexPathForSelectedItem = indexPath

        if let tabItemView = collectionView.cellForItem(at: indexPath) as? TabItemViewCell {
            tabItemView.showSelected()
        }

        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)

        let tabItem = tabsItems[row]
        delegate?.tabsView(self, didSelectTab: tabItem)
    }

    func deselectTabItem(at row: Int) {
        let indexPath = IndexPath(item: row, section: 0)
        if let tabItemView = collectionView.cellForItem(at: indexPath) as? TabItemViewCell {
            tabItemView.showDeselected()
        }
    }

    func reloadContent() {
        firstIndexPathForSelectedItem = nil
        updateEstimatedItemSize()
        collectionView.reloadData()
    }

    func updateEstimatedItemSize() {
        if tabsItems.count <= Constants.maximuItemWithFixSize {
            layout.estimatedItemSize = CGSize.zero
        } else {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
}

// MARK: UICollectionViewDataSource

extension TabsView: UICollectionViewDataSource {
    public func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        tabsItems.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard tabsItems.indices.contains(indexPath.item) else {
            fatalError("Inconsistency between the collectionView and it's dataSource: Trying to fetch cell for item at indexPath \(indexPath), but the index was not valid. Current tabs list: \(tabsItems)")
        }

        let tabItem = tabsItems[indexPath.item]
        let tabItemView = TabItemViewCell.dequeueReusableCell(for: indexPath, from: collectionView)
        tabItemView.text = tabItem.title
        tabItemView.icon = tabItem.icon
        tabItemView.accessibilityIdentifier = tabItem.accessibilityIdentifier

        let hasLargeScreen = frame.width >= Constants.minimumWidthForIpad
        tabItemView.activeMinimumWidthConstraint(hasLargeScreen)

        if indexPath == firstIndexPathForSelectedItem || firstIndexPathForSelectedItem == nil {
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
            firstIndexPathForSelectedItem = indexPath
            tabItemView.showSelected()
        } else {
            tabItemView.showDeselected()
        }

        return tabItemView
    }
}

// MARK: UICollectionViewDelegate

extension TabsView: UICollectionViewDelegate {
    public func collectionView(_: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        indexPath.item != collectionView.indexPathsForSelectedItems?.first?.item
    }

    public func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectTabItem(at: indexPath.row)
    }

    public func collectionView(_: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        deselectTabItem(at: indexPath.row)
    }
}

// MARK: Theme Variant did change notification

@objc extension TabsView {
    func themeDidChange() {
        reloadContent()
    }
}

// MARK: UILargeContentViewerInteractionDelegate

@available(iOS 13, *)
extension TabsView: UILargeContentViewerInteractionDelegate {
    public func largeContentViewerInteraction(_: UILargeContentViewerInteraction, didEndOn item: UILargeContentViewerItem?, at _: CGPoint) {
        guard let cell = item as? TabItemViewCell,
              let indexPath = collectionView.indexPath(for: cell) else { return }

        selectTabItem(at: indexPath.row)
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension TabsView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if tabsItems.count <= Constants.maximuItemWithFixSize {
            let width: CGFloat = min(Constants.maximumWidthItem, frame.width / CGFloat(tabsItems.count))
            return CGSize(width: width, height: Constants.componentHeight)
        } else {
            return layout.itemSize
        }
    }
}
