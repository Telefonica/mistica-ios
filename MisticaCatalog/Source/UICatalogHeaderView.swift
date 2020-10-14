//
//  UICatalogHeaderView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import UIKit

class BrandStyleSelectorView: UIView {
    private let stackView = UIStackView(arrangedSubviews: [])

    private let misticaLogoImageView = UIImageView(image: .misticaLogo)
    private let segment = UISegmentedControl()
    private let libraryVersionLabel = UILabel()

    var didSelectBrandStyle: ((BrandStyle) -> Void)?
    var showBrandSelector = true {
        didSet {
            segment.isHidden = !showBrandSelector
        }
    }

    init() {
        super.init(frame: .zero)
        setUp()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BrandStyleSelectorView {
    var misticaVersion: String? {
        let misticaBundle = Bundle(for: Button.self)

        guard let bundleDictionary = misticaBundle.infoDictionary else { return nil }

        return bundleDictionary["CFBundleShortVersionString"] as? String
    }

    func setUp() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10

        misticaLogoImageView.contentMode = .scaleAspectFit

        BrandStyle.allCases.enumerated().forEach { pair in
            segment.insertSegment(withTitle: pair.element.rawValue, at: pair.offset, animated: false)

            if pair.element == MisticaConfig.brandStyle {
                segment.selectedSegmentIndex = pair.offset
            }
        }

        segment.addTarget(self, action: #selector(didValueChange), for: .valueChanged)

        addSubview(withDefaultConstraints: stackView)

        stackView.addArrangedSubview(misticaLogoImageView)
        stackView.addArrangedSubview(segment)

        addSubview(libraryVersionLabel, constraints: [
            libraryVersionLabel.bottomAnchor.constraint(equalTo: misticaLogoImageView.bottomAnchor),
            libraryVersionLabel.trailingAnchor.constraint(equalTo: misticaLogoImageView.trailingAnchor)
        ])

        if let misticaVersion = misticaVersion {
            libraryVersionLabel.text = "v\(misticaVersion)"
        }

        libraryVersionLabel.font = .textPreset6(weight: .medium)
        libraryVersionLabel.textColor = UIColor(red: 0, green: 50 / 255, blue: 69 / 255, alpha: 1)
    }

    @objc func didValueChange() {
        didSelectBrandStyle?(BrandStyle.allCases[segment.selectedSegmentIndex])
    }
}
