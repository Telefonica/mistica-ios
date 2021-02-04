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
        static let estimatedItemSize = CGSize(width: 100, height: 24)
    }
    
    // Layout is initialized to a default UICollectionViewFlowLayout. It will be overriden during set up phase.
    private var layout = UICollectionViewFlowLayout()
    private let collectionView: UICollectionView
    
    private lazy var divider: UIView = {
        let divider = UIView()
        divider.backgroundColor = .orange //.divider
        return divider
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
    public func update(_ tabItem: TabItem, newTabItem: TabItem) {
            
    }
        
    public func remove(_ tabItem: TabItem) {
            
    }
}

// MARK: - Private

private extension TabsView {
    func commomInit() {
        setUpDivider()

        setUpLayout()
        setUpCollectionView()
    }
    
    func setUpDivider() {
        addSubview(divider, constraints: [
            divider.bottomAnchor.constraint(equalTo: bottomAnchor),
            divider.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: Constants.dividerHeight)
        ])
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

        addSubview(collectionView, constraints: [
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            collectionView.bottomAnchor.constraint(equalTo: divider.topAnchor),
            
            collectionView.heightAnchor.constraint(equalToConstant: Constants.componentHeight)
        ])

        collectionView.dataSource = self
        collectionView.delegate = self

        TabItemView.registerClassForCell(to: collectionView)
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
        let tabItemView = TabItemView.dequeueReusableCell(for: indexPath, from: collectionView)
        tabItemView.text = tabItem.title
        tabItemView.isSelected ? tabItemView.showSelected() : tabItemView.showDeselected()
        return tabItemView
    }
}

extension TabsView: UICollectionViewDelegate {
    public func collectionView(_: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        indexPath.item != collectionView.indexPathsForSelectedItems?.first?.item
    }

    public func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let tabItemView = collectionView.cellForItem(at: indexPath) as? TabItemView else { return }
        tabItemView.showSelected()
    }
    
    public func collectionView(_: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let tabItemView = collectionView.cellForItem(at: indexPath) as? TabItemView else { return }
        tabItemView.showDeselected()
    }
}
