import Mistica
import SnapshotTesting
import SwiftUI
import XCTest

final class InputFieldTests: XCTestCase {
    override class func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)

        isRecording = false
    }

    func testText() {
        let input = makeTemplate(style: .text)

        assertSnapshot(
            matching: input,
            as: .image
        )
    }

    func testSecure() {
        let input = makeTemplate(style: .secure)

        assertSnapshot(
            matching: input,
            as: .image
        )
    }

    func testPhone() {
        let input = makeTemplate(style: .phone(code: "+34"))

        assertSnapshot(
            matching: input,
            as: .image
        )
    }

    func testSearch() {
        let input = makeTemplate(style: .search)

        assertSnapshot(
            matching: input,
            as: .image
        )
    }

    func testDate() {
        let input = makeTemplate(style: .date())

        assertSnapshot(
            matching: input,
            as: .image
        )
    }

    func testDropdown() {
        let input = makeTemplate(style: .dropdown(options: ["1", "2"]))

        assertSnapshot(
            matching: input,
            as: .image
        )
    }
}

private extension InputFieldTests {
    func makeTemplate(
        style: InputField.Style,
        text: String = "Text",
        placeholder: String = "Placeholder",
        assistiveText: String = "AssistiveText"
    ) -> some View {
        VStack {
            InputField(placeholder: placeholder, text: .constant(""))
                .style(style)

            InputField(placeholder: placeholder, text: .constant(text))
                .style(style)

            InputField(placeholder: placeholder, text: .constant(text), assistiveText: .constant(assistiveText))
                .style(style)

            InputField(placeholder: placeholder, text: .constant(text), assistiveText: .constant(assistiveText), state: .constant(.invalid))
                .style(style)
        }
        .frame(width: 300)
        .padding()
    }
}
