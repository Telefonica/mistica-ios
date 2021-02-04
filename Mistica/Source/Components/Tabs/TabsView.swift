//
//  TabsView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public protocol TabsViewDelegate: AnyObject {
    func tabsView(_ tabsView: TabsView, didSelectTab tabItem: TabItem)
}

public class TabsView: UIView {
    private var horizontalStack: UIStackView = {
        let horizontalStack = UIStackView()
        horizontalStack.backgroundColor = .purple
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .leading
        horizontalStack.spacing = 0
        horizontalStack.distribution = .fill
        return horizontalStack
    }()
    
    private var tabItems: [TabItem] = []
    
    public init(tabItems: [TabItem]) {
        self.tabItems = tabItems
        
        super.init(frame: .zero)
        
        commomInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commomInit()
    }
    
    public func update(_ tabItem: TabItem, newTabItem: TabItem) {
        
    }
    
    public func remove(_ tabItem: TabItem) {
        
    }
}

// MARK: - Private

private extension TabsView {
    func commomInit() {
        setUpHorizontalStack()
    }
    
    func setUpHorizontalStack() {
        backgroundColor = .yellow
        addSubview(withDefaultConstraints: horizontalStack)
        
        for tabItem in tabItems {
            let itemView = TabItemView(tabItem: tabItem)
            horizontalStack.addArrangedSubview(itemView)
        }
    }
}
