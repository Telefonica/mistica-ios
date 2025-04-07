//
//  TextLink.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public protocol TextLinkDelegate: AnyObject {
    func textLink(_ view: TextLink, tappedText: String)
}

public class TextLink: UITextView, UITextViewDelegate {

    public weak var linkDelegate: TextLinkDelegate?
    private var linkedWords: [String] = []

    public init(fullText: String, linkedWords: [String]? = nil, font: UIFont = .textPreset2(weight: .link), color: UIColor = .black, isInverse: Bool = false) {
        super.init(frame: .zero, textContainer: nil)

        isEditable = false
        isScrollEnabled = false
        backgroundColor = .clear
        delegate = self

        self.linkedWords = linkedWords ?? [fullText]
        setupText(fullText: fullText, font: font, color: color, isInverse: isInverse)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupText(fullText: String, font: UIFont, color: UIColor, isInverse: Bool) {
        let attributed = NSMutableAttributedString(string: fullText, attributes: [
            .font: font,
            .foregroundColor: color
        ])

        for word in linkedWords {
            let pattern = "\\b\(NSRegularExpression.escapedPattern(for: word))\\b"
            let regex = try? NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
            let matches = regex?.matches(in: fullText, range: NSRange(fullText.startIndex..., in: fullText)) ?? []

            for match in matches {
                attributed.addAttributes([
                    .foregroundColor: isInverse ? UIColor.textLinkInverse : UIColor.textLink,
                    .underlineStyle: NSUnderlineStyle.single.rawValue
                ], range: match.range)
            }
        }

        self.attributedText = attributed
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }

    @objc private func handleTap(sender: UITapGestureRecognizer) {
        let location = sender.location(in: self)
        guard let position = closestPosition(to: location),
              let range = tokenizer.rangeEnclosingPosition(position, with: .word, inDirection: UITextDirection.layout(.left)),
              let tappedText = text(in: range),
              linkedWords.contains(where: { $0.caseInsensitiveCompare(tappedText) == .orderedSame }) else {
            return
        }

        linkDelegate?.textLink(self, tappedText: tappedText)
    }
}

