//
//  TabsTests.swift
//  Mistica
//
//  Created by dmarin on 17/3/21.
//

import Mistica
import SnapshotTesting
import XCTest

final class TabsTests: XCTestCase {
    override class func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)

        isRecording = false
    }
    
    // MARK: - Styles
    
    func testTab() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplate(width: Constants.mobileWidth))
    }
}

// MARK: - Helpers

private extension TabsTests {
    enum Constants {
        static let mobileWidth: CGFloat = 390
        static let minimumTabletWidth: CGFloat = 768
        static let heightComponent: CGFloat = 56
        static let padding: CGFloat = 20
    }
    
    private func makeTemplate(width: CGFloat) -> UIView {
        let tabItems: [TabItem] = [
            TabItem(title: "Movies", icon: nil, accessibilityIdentifier: nil),
            TabItem(title: "Phone", icon: nil, accessibilityIdentifier: nil)
        ]
        
        let contentView = UIView(frame: CGRect(origin: .zero,
                                               size: CGSize(width: width + Constants.padding, height: Constants.heightComponent + Constants.padding)))
        contentView.backgroundColor = .black
        
        let tabView = TabsView(tabItems: tabItems)
        let size = CGSize(width: width, height: Constants.heightComponent)
        tabView.frame = CGRect(origin: CGPoint(x: 10, y: 10), size: size)
        
        contentView.addSubview(tabView)
        
        return contentView
    }
}
