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
    func textLink(_ view: TextLink, tappedText: String)
}

public class TextLink: UITextView, UITextViewDelegate {

    public weak var linkDelegate: TextLinkDelegate?

    private var linkedWords: [LinkedWord] = []
    private var linkRanges: [NSRange: String] = [:]

    public init(fullText: String,
                linkedWords: [LinkedWord],
                font: UIFont = .textPreset2(weight: .link),
                textColor: UIColor = .black,
                linkColor: UIColor = UIColor.textLink,
                isInverse: Bool = false) {
        super.init(frame: .zero, textContainer: nil)

        isEditable = false
        isScrollEnabled = false
        backgroundColor = .clear
        delegate = self
        self.linkedWords = linkedWords

        setupText(fullText: fullText, font: font, textColor: textColor, linkColor: linkColor, isInverse: isInverse)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupText(fullText: String, font: UIFont, textColor: UIColor, linkColor: UIColor, isInverse: Bool) {
        let attributed = NSMutableAttributedString(string: fullText, attributes: [
            .font: font,
            .foregroundColor: textColor
        ])

        for linkedWord in linkedWords {
            let pattern = "\\b\(NSRegularExpression.escapedPattern(for: linkedWord.word))\\b"
            let regex = try? NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
            let matches = regex?.matches(in: fullText, range: NSRange(fullText.startIndex..., in: fullText)) ?? []

            if matches.indices.contains(linkedWord.matchIndex) {
                let match = matches[linkedWord.matchIndex]
                attributed.addAttributes([
                    .foregroundColor: isInverse ? UIColor.textLinkInverse : linkColor,
                    .underlineStyle: NSUnderlineStyle.single.rawValue
                ], range: match.range)
                linkRanges[match.range] = linkedWord.word
            }
        }

        self.attributedText = attributed
    }

    @objc private func handleTap(sender: UITapGestureRecognizer) {
        let location = sender.location(in: self)

        guard let position = closestPosition(to: location),
              let textRange = tokenizer.rangeEnclosingPosition(position, with: .word, inDirection: UITextDirection.layout(.left)) else {
            return
        }

        let startOffset = offset(from: beginningOfDocument, to: textRange.start)
        let length = offset(from: textRange.start, to: textRange.end)
        let tappedNSRange = NSRange(location: startOffset, length: length)

        if let linkedWord = linkRanges.first(where: { NSEqualRanges($0.key, tappedNSRange) }) {
            linkDelegate?.textLink(self, tappedText: linkedWord.value)
        }
    }
}
