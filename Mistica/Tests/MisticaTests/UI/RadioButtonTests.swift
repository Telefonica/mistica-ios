//
//  RadioButtonTests.swift
//  Mistica
//
//  Created by jalonso on 9/3/21.
//

import SnapshotTesting
import Mistica
import XCTest

final class RadioButtonTests: XCTestCase {
    
    private let buttonSize = CGSize(width: 30.0, height: 30.0)
    
    override class func setUp() {
        super.setUp()
        
        isRecording = false
    }
    
    func testRadioButtonEnabled() {
        assertSnapshotForAllBrands(
            as: .image(size: buttonSize),
            viewBuilder: makeRadioButtonTemplate(active: true)
        )
    }
    
    func testRadioButtonDisabled() {
        assertSnapshotForAllBrands(
            as: .image(size: buttonSize),
            viewBuilder: makeRadioButtonTemplate(active: false)
        )
    }
}

private extension RadioButtonTests {
    func makeRadioButtonTemplate(active: Bool) -> UIView {
        let radioButton = RadioButton()
        radioButton.isActivated = active
        return radioButton
    }
}
