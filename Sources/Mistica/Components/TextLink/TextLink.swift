//
//  TextLink.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public struct LinkedWord {
    public let word: String
    public let matchIndex: Int

    public init(word: String, matchIndex: Int = 0) {
        self.word = word
        self.matchIndex = matchIndex
    }
}

public protocol TextLinkDelegate: AnyObject {
    func textLink(_ view: TextLink, tappedWord: String, matchIndex: String)
}

public class TextLink: UITextView, UITextViewDelegate {
    public weak var linkDelegate: TextLinkDelegate?

    private var linkedWords: [LinkedWord] = []
    private var linkRanges: [NSRange: String] = [:]

    // Flag to prevent voiceOver bug to call delegate twice
    private var isHandlingTap = false
    private let debounceInterval: TimeInterval = 1

    public init(fullText: String,
                linkedWords: [LinkedWord],
                font: UIFont = .textPreset2(weight: .link),
                textColor: UIColor = .black,
                linkColor: UIColor = UIColor.textLink,
                isInverse: Bool = false) {
        super.init(frame: .zero, textContainer: nil)

        isEditable = false
        isSelectable = true
        isScrollEnabled = false
        backgroundColor = .clear
        delegate = self
        dataDetectorTypes = []
        isAccessibilityElement = false

        self.linkedWords = linkedWords
        setupText(fullText: fullText, font: font, textColor: textColor, linkColor: linkColor, isInverse: isInverse)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setupText(fullText: String,
                          font: UIFont,
                          textColor: UIColor,
                          linkColor: UIColor,
                          isInverse: Bool) {
        let attributed = NSMutableAttributedString(string: fullText, attributes: [
            .font: font,
            .foregroundColor: textColor
        ])

        linkRanges.removeAll()

        for linkedWord in linkedWords {
            let pattern = "\\b\(NSRegularExpression.escapedPattern(for: linkedWord.word))\\b"
            let regex = try? NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
            let matches = regex?.matches(in: fullText, range: NSRange(fullText.startIndex..., in: fullText)) ?? []

            if matches.indices.contains(linkedWord.matchIndex) {
                let match = matches[linkedWord.matchIndex]
                attributed.addAttributes([
                    .foregroundColor: isInverse ? UIColor.textLinkInverse : linkColor,
                    .underlineStyle: NSUnderlineStyle.single.rawValue,
                    .link: URL(string: "textLink://\(linkedWord.word)/\(linkedWord.matchIndex)")!
                ], range: match.range)
            }
        }

        attributedText = attributed
    }

    public func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        guard URL.scheme == "textLink" else { return true }

        guard !isHandlingTap else { return false }
        isHandlingTap = true
        DispatchQueue.main.asyncAfter(deadline: .now() + debounceInterval) {
            self.isHandlingTap = false
        }

        let pathComponents = URL.pathComponents
        if let word = URL.host,
           let matchIndex = pathComponents.last {
            linkDelegate?.textLink(self, tappedWord: word, matchIndex: matchIndex)
        }

        return false
    }
}
