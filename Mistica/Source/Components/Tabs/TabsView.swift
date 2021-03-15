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
        static let componentHeight: CGFloat = 55
        static let estimatedItemSize = CGSize(width: 100, height: 55)
        static let firstIndexPath = IndexPath(row: 0, section: 0)
    }
    
    // Layout is initialized to a default UICollectionViewFlowLayout. It will be overriden during set up phase.
    private var layout = UICollectionViewFlowLayout()
    private let collectionView: UICollectionView
    
    private lazy var divider: UIView = {
        let divider = UIView()
        divider.backgroundColor = .divider
        return divider
    }()
    
    private lazy var selectedItemIndexPath: IndexPath? = {
        let firstSelectedItem = collectionView.indexPathsForSelectedItems?.first
        return firstSelectedItem
    }()
    
    private var tabsItems: [TabItem] = []
    
    public weak var delegate: TabsViewDelegate?

    public init(tabItems: [TabItem]) {
        self.tabsItems = tabItems
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        super.init(frame: .zero)
        
        commomInit()
    }

    public required init?(coder: NSCoder) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        super.init(coder: coder)
        
        commomInit()
    }
}

// MARK: - Public

extension TabsView {
    public func reload(with tabItems: [TabItem]) {
        self.tabsItems = tabItems
        reloadContent()
    }
    
    public func update(_ tabItem: TabItem, newTabItem: TabItem) {
        guard let index = tabsItems.firstIndex(where: { $0 == tabItem }) else { return }
        tabsItems[index] = newTabItem
        collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
    }
        
    public func remove(_ tabItem: TabItem) {
        guard let index = tabsItems.firstIndex(where: { $0 == tabItem }) else { return }
        tabsItems.remove(at: index)
        collectionView.reloadData()
    }
    
    public func selectTabItem(at index: Int) {
        guard index < tabsItems.count else { return }

        // Deselection
        if let selectedItemIndexPath = selectedItemIndexPath {
            deselectTabItem(at: selectedItemIndexPath)
        }

        // Selection
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        selectTabItem(at: indexPath)
    }
}

// MARK: - Private

private extension TabsView {
    func commomInit() {
        setUpDivider()
        setUpLayout()
        setUpCollectionView()
        
        // Listen to theme variant changes
        NotificationCenter.default.addObserver(self, selector: #selector(themeDidChange), name: .themeVariantDidChange, object: nil)
    }
        
    func setUpLayout() {
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = Constants.estimatedItemSize
        collectionView.collectionViewLayout = layout
    }
    
    func setUpCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.clipsToBounds = false
        collectionView.selectItem(at: Constants.firstIndexPath, animated: false, scrollPosition: [])

        addSubview(collectionView, constraints: [
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: divider.topAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: Constants.componentHeight)
        ])

        collectionView.dataSource = self
        collectionView.delegate = self

        TabItemViewCell.registerClassForCell(to: collectionView)
    }

    func setUpDivider() {
        addSubview(divider, constraints: [
            divider.bottomAnchor.constraint(equalTo: bottomAnchor),
            divider.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: Constants.dividerHeight)
        ])
    }
    
    func selectTabItem(at indexPath: IndexPath) {
        guard let tabItemView = collectionView.cellForItem(at: indexPath) as? TabItemViewCell else { return }
        let tabItem = tabsItems[indexPath.item]
        tabItemView.showSelected()
        delegate?.tabsView(self, didSelectTab: tabItem)
    }
    
    func deselectTabItem(at indexPath: IndexPath) {
        guard let tabItemView = collectionView.cellForItem(at: indexPath) as? TabItemViewCell else {
            return
        }
        tabItemView.showDeselected()
    }
    
    func reloadContent() {
        collectionView.reloadData()
        guard tabsItems.count > 0 else { return }
        let firstItem = IndexPath(item: 0, section: 0)
        collectionView.scrollToItem(at: firstItem, at: .left, animated: false)
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
        
        if tabItemView.isSelected {
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
