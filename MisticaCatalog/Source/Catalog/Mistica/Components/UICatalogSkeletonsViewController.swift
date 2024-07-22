//
//  UICatalogSkeletonsViewController.swift
//  MisticaCatalog
//
//  Created by Alejandro Ruiz on 18/7/24.
//

import UIKit
import Mistica

class UICatalogSkeletonsViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        addSkeletons()
    }

    private func addSkeletons() {
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.spacing = 40
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mainStackView)

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])

        addSkeletonWithLabel(to: mainStackView, label: "Line", skeleton: Skeleton(type: .line(width: 360)))

        addSkeletonWithLabel(to: mainStackView, label: "Text", skeleton: Skeleton(type: .text()))

        addSkeletonWithLabel(to: mainStackView, label: "Circle", skeleton: Skeleton(type: .circle(size: 40)))

        addSkeletonWithLabel(to: mainStackView, label: "Row", skeleton: Skeleton(type: .row))

        addSkeletonWithLabel(to: mainStackView, label: "Rectangle", skeleton: Skeleton(type: .rectangle(size: CGSize(width: 360, height: 180), isRounded: true)))

        contentView.heightAnchor.constraint(equalTo: mainStackView.heightAnchor, constant: 32).isActive = true
    }

    private func addSkeletonWithLabel(to mainStackView: UIStackView, label: String, skeleton: Skeleton) {
        let individualStackView = UIStackView()
        individualStackView.axis = .vertical
        individualStackView.alignment = .fill
        individualStackView.spacing = 16
        individualStackView.translatesAutoresizingMaskIntoConstraints = false

        let titleLabel = UILabel()
        titleLabel.text = label
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        individualStackView.addArrangedSubview(titleLabel)
        individualStackView.addArrangedSubview(skeleton)

        mainStackView.addArrangedSubview(individualStackView)

        individualStackView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor).isActive = true

        if case .text = skeleton.type {
            skeleton.widthAnchor.constraint(equalTo: individualStackView.widthAnchor).isActive = true
        }
        if case .row = skeleton.type {
            skeleton.widthAnchor.constraint(equalTo: individualStackView.widthAnchor).isActive = true
        }
    }
}




