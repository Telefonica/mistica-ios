//
//  TabsView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

/// The TabsViewDelegate protocol defines methods that allow you to manage the selection and deselection of
/// segments in a `SegmentSelector`. The methods of this protocol are all optional.
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
    }
    
    private lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout);

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = false
        collectionView.alwaysBounceVertical = false
        collectionView.bounces = false
        collectionView.clipsToBounds = false
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
        layout.minimumInteritemSpacing = 0
        return layout
    }()

    private lazy var divider: UIView = {
        let divider = UIView()
        divider.backgroundColor = .divider
        return divider
    }()
    
    private var firstIndexPathForSelectedItem: IndexPath?
    
    var widthOfScreen: CGFloat {
        self.frame.width
    }

    private var tabsItems: [TabItem] = []
    
    public weak var delegate: TabsViewDelegate?

    public init(tabItems: [TabItem]) {
        self.tabsItems = tabItems

        super.init(frame: .zero)
        
        commomInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commomInit()
    }
}

// MARK: - Public

extension TabsView {
    public func reload(with tabItems: [TabItem]) {
        self.tabsItems = tabItems
        reloadContent()
        collectionView.performBatchUpdates(nil) { _ in
            guard let firstTabItem = tabItems.first else { return }
            self.delegate?.tabsView(self, didSelectTab: firstTabItem)
        }
    }
    
    public func update(_ tabItem: TabItem, newTabItem: TabItem) {
        guard let index = tabsItems.firstIndex(where: { $0 == tabItem }) else { return }
        tabsItems[index] = newTabItem
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.reloadItems(at: [indexPath])
        collectionView.performBatchUpdates(nil) { _ in
            self.selectTabItem(at: indexPath)
        }
    }
        
    public func remove(_ tabItem: TabItem) {
        guard let index = tabsItems.firstIndex(where: { $0 == tabItem }) else { return }
        tabsItems.remove(at: index)
        collectionView.reloadData()
        collectionView.performBatchUpdates(nil) { _ in
            self.selectTabItem(at: IndexPath(item: 0, section: 0))
        }
    }
}

// MARK: - Private

private extension TabsView {
    func commomInit() {
        setUpDivider()
        setUpCollectionView()
        
        // Listen to theme variant changes
        NotificationCenter.default.addObserver(self, selector: #selector(themeDidChange), name: .themeVariantDidChange, object: nil)
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
            self.heightAnchor.constraint(equalToConstant: Constants.componentHeight)
        ])
    }
    
    func selectTabItem(at indexPath: IndexPath) {
        guard let tabItemView = collectionView.cellForItem(at: indexPath) as? TabItemViewCell else { return }
        let tabItem = tabsItems[indexPath.item]
        tabItemView.showSelected()
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        tabItemView.isSelected = true
        delegate?.tabsView(self, didSelectTab: tabItem)
    }
    
    func deselectTabItem(at indexPath: IndexPath) {
        guard let tabItemView = collectionView.cellForItem(at: indexPath) as? TabItemViewCell else {
            return
        }
        tabItemView.showDeselected()
    }
    
    func reloadContent() {
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
        
        if indexPath == firstIndexPathForSelectedItem || firstIndexPathForSelectedItem == nil {
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .left)
            firstIndexPathForSelectedItem = indexPath
            tabItemView.showSelected()
            tabItemView.isSelected = true
        } else {
            tabItemView.showDeselected()
            tabItemView.isSelected = false
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
        selectTabItem(at: indexPath)
    }
    
    public func collectionView(_: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        deselectTabItem(at: indexPath)
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

        selectTabItem(at: indexPath)
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension TabsView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if tabsItems.count <= Constants.maximuItemWithFixSize {
            return CGSize(width: (1.0 * widthOfScreen) / CGFloat(tabsItems.count), height: Constants.componentHeight)
        } else {
            return layout.itemSize
        }
    }
}
