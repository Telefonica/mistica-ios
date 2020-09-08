//
//  UICatalogHeaderView.swift
//  MisticaCatalog
//
//  Created by Jose Miguel Brocal on 03/08/2020.
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import UIKit

class BrandStyleSelectorView: UIView {
    private let stackView = UIStackView(arrangedSubviews: [])

    private let misticaLogoImageView = UIImageView(image: .misticaLogo)
    private let segment = UISegmentedControl()

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
    }

    @objc func didValueChange() {
        didSelectBrandStyle?(BrandStyle.allCases[segment.selectedSegmentIndex])
    }
}
