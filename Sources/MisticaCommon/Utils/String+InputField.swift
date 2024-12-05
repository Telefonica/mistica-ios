//
//  String+InputField.swift
//  Mistica
//
//  Created by Alejandro Ruiz on 5/12/24.
//

import Foundation

private let localPartEmailRegex = (try? NSRegularExpression(
    pattern: "^[A-Z0-9a-z_%+-]+(\\.[A-Z0-9a-z_%+-]+)*$",
    options: .caseInsensitive
))!
private let domainEmailRegex = (try? NSRegularExpression(
    pattern: "^([-A-Za-z0-9]{1,63}\\.)+[A-Za-z]{2,63}$",
    options: .caseInsensitive
))!
private let weirdCharactersForPhoneRegex = (try? NSRegularExpression(
    pattern: "[a-z:]+",
    options: .caseInsensitive
))!


extension String {
    var trimmingWhiteSpace: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var looksLikeAnEmail: Bool {
        guard !isEmpty else { return false }

        // Trimming first to avoid problems...
        // For instance, it is common to put the shortcut for your email,
        // and then tap space. That way, if not trimming, the email is considered
        // as invalid.
        let trimmedSelf = trimmingWhiteSpace

        // No email could be longer than 254 chars.
        guard trimmedSelf.utf16.count <= 254 else { return false }

        let emailParts = trimmedSelf.components(separatedBy: "@")

        guard emailParts.count == 2 else { return false }

        let localPart = emailParts[0]
        let domain = emailParts[1]

        guard localPart.utf16.count <= 64 else { return false }

        let localPartRange = NSRange(location: 0, length: localPart.utf16.count)
        let domainRange = NSRange(location: 0, length: domain.utf16.count)

        guard localPartEmailRegex.firstMatch(in: localPart, range: localPartRange) != nil else { return false }

        guard domainEmailRegex.firstMatch(in: domain, range: domainRange) != nil else { return false }

        return true
    }

    var looksLikeAPhoneNumber: Bool {
        guard !isEmpty else { return false }

        let phoneNumberTypes: NSTextCheckingResult.CheckingType = [.phoneNumber]

        guard let detector = try? NSDataDetector(types: phoneNumberTypes.rawValue) else { return false }

        let range = NSRange(location: 0, length: utf16.count)
        let containsPhoneNumberCharacters = detector.numberOfMatches(in: self, range: range) > 0

        guard containsPhoneNumberCharacters else { return false }

        // Avoid NSDataDetector bug where it returns "movil: 611223344"

        let containsWeirdCharacters = weirdCharactersForPhoneRegex.numberOfMatches(in: self, range: range) > 0

        return !containsWeirdCharacters
    }
}