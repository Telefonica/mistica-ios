import Mistica
import SnapshotTesting
import SwiftUI
import XCTest

final class FontStyleTests: XCTestCase {
    typealias Label = (view: Text, text: String)

    override class func setUp() {
        isRecording = false
    }

    func testDefaultFonts() {
        FontStyle.fontNameForWeight = nil

        let testCases = makeTestCases()

        assertSnapshot(
            matching: makeTemplate(testCases),
            as: .image
        )
    }

    func testCustomFonts() {
        FontStyle.fontNameForWeight = { weight in
            switch weight {
            case .light, .ultraLight, .thin:
                return "Telefonica-Light"
            case .regular:
                return "Telefonica-Regular"
            case .medium, .bold, .semibold, .black, .heavy:
                return "Telefonica-Bold"
            default:
                return "Telefonica-Regular"
            }
        }
        FontLoader.loadCustomFonts(for: "otf")

        let testCases = makeTestCases()

        assertSnapshot(
            matching: makeTemplate(testCases),
            as: .image
        )
    }

    func makeTestCases() -> [Label] {
        var labels = [Label]()

        let textPreset1 = FontStyle.TextPreset1Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset1 \(weight)",
                font: .textPreset1(weight: weight)
            )
        }
        let textPreset2 = FontStyle.TextPreset2Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset2 \(weight)",
                font: .textPreset2(weight: weight)
            )
        }
        let textPreset3 = FontStyle.TextPreset3Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset3 \(weight)",
                font: .textPreset3(weight: weight)
            )
        }
        let textPreset4 = FontStyle.TextPreset4Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset4 \(weight)",
                font: .textPreset4(weight: weight)
            )
        }
        let textPreset5 = FontStyle.TextPreset5Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset5 \(weight)",
                font: .textPreset5(weight: weight)
            )
        }
        let textPreset6 = FontStyle.TextPreset6Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset6 \(weight)",
                font: .textPreset6(weight: weight)
            )
        }
        let textPreset7 = FontStyle.TextPreset7Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset7 \(weight)",
                font: .textPreset7(weight: weight)
            )
        }
        let textPreset8 = FontStyle.TextPreset8Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset8 \(weight)",
                font: .textPreset8(weight: weight)
            )
        }
        let textPreset9 = FontStyle.TextPreset9Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset9 \(weight)",
                font: .textPreset9(weight: weight)
            )
        }
        let textPreset10 = FontStyle.TextPreset10Weight.allCases.map { weight in
            makeLabel(
                text: "textPreset10 \(weight)",
                font: .textPreset10(weight: weight)
            )
        }

        labels.append(contentsOf: textPreset1)
        labels.append(contentsOf: textPreset2)
        labels.append(contentsOf: textPreset3)
        labels.append(contentsOf: textPreset4)
        labels.append(contentsOf: textPreset5)
        labels.append(contentsOf: textPreset6)
        labels.append(contentsOf: textPreset7)
        labels.append(contentsOf: textPreset8)
        labels.append(contentsOf: textPreset9)
        labels.append(contentsOf: textPreset10)

        return labels
    }

    func makeLabel(text: String, font: Font) -> Label {
        (Text(text).font(font), text)
    }

    private func makeTemplate(_ labels: [Label]) -> some View {
        VStack {
            ForEach(labels, id: \.text) {
                $0.view
            }
        }
        .frame(width: 250, height: 400)
    }
}

class FontLoader {
    class func loadCustomFonts(for fontExtension: String) {
        let fileManager = FileManager.default
        let bundleURL = Bundle(for: FontLoader.self).bundleURL
        do {
            let contents = try fileManager.contentsOfDirectory(at: bundleURL, includingPropertiesForKeys: [], options: .skipsHiddenFiles)
            for url in contents {
                if url.pathExtension == fontExtension {
                    guard let fontData = NSData(contentsOf: url),
                          let provider = CGDataProvider(data: fontData),
                          let font = CGFont(provider) else {
                        continue
                    }

                    CTFontManagerRegisterGraphicsFont(font, nil)
                }
            }
        } catch {
            print("Error loading font: \(error)")
        }
    }
}
