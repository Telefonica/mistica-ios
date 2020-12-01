@testable import Mistica
import SnapshotTesting
import XCTest

final class CroutonTests: XCTestCase {
    override func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)
    }
    
    func testInfoCrouton() {
        assertSnapshotForAllBrands(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeCrouton(
                withText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: .info
            )
        )
    }
    
    func testInfoCroutonWithShortActionTitle() {
        assertSnapshotForAllBrands(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeCrouton(
                withText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                actionTitle: "Nostrud",
                style: .info
            )
        )
    }
    
    func testInfoCroutonWithLongActionTitle() {
        assertSnapshotForAllBrands(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeCrouton(
                withText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                actionTitle: "Excepteur sint occaecat cupidatat",
                style: .info
            )
        )
    }
    
    func testCriticalCrouton() {
        assertSnapshotForAllBrands(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeCrouton(
                withText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: .critical
            )
        )
    }
    
    func testCriticalCroutonWithShortActionTitle() {
        assertSnapshotForAllBrands(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeCrouton(
                withText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                actionTitle: "Nostrud",
                style: .critical
            )
        )
    }
    
    func testCriticalCroutonWithLongActionTitle() {
        assertSnapshotForAllBrands(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeCrouton(
                withText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                actionTitle: "Excepteur sint occaecat cupidatat",
                style: .critical
            )
        )
    }
}

private extension CroutonTests {
    func makeCrouton(withText text: String, actionTitle: String? = nil, style: CroutonStyle) -> UIViewController {
        let viewController = CroutonTestViewController(
            text: text,
            action: actionTitle.map { ($0, {}) },
            style: style
        )
        return viewController
    }
}

private class CroutonTestViewController: UIViewController {
    private let text: String
    private let action: CroutonController.ActionConfig?
    private let style: CroutonStyle
    
    init(text: String, action: CroutonController.ActionConfig?, style: CroutonStyle) {
        self.text = text
        self.action = action
        self.style = style
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        CroutonController().showCrouton(
            withText: text,
            action: action,
            style: style,
            rootViewController: self
        )
    }
}
