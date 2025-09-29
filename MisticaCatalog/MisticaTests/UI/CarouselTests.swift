//
//  CarouselTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class CarouselTests: XCTestCase {
    override func setUp() {
        super.setUp()
        MisticaConfig.brandStyle = .movistar
    }

    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    // MARK: - Layout

    // MARK: - Default config

    func testCellWithTitle() {
        let carouselTestsViewController = makeCarouselTestsViewController(
            title: AnyValues.title
        )

        assertSnapshot(
            of: carouselTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndImage() {
        let carouselTestsViewController = makeCarouselTestsViewController(
            title: AnyValues.title,
            assetType: .custom(.image(AnyValues.image))
        )

        assertSnapshot(
            of: carouselTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndSubtitle() {
        let carouselTestsViewController = makeCarouselTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle
        )

        assertSnapshot(
            of: carouselTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndSubtitleAndImage() {
        let carouselTestsViewController = makeCarouselTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            assetType: .smallIcon(AnyValues.image)
        )

        assertSnapshot(
            of: carouselTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndSubtitleAndImageWithHeadline() {
        let carouselTestsViewController = makeCarouselTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            assetType: .smallIcon(AnyValues.image),
            showHeadline: true
        )

        assertSnapshot(
            of: carouselTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndSubtitleAndImageWithHeadlineAndNavigationPreset() {
        let carouselTestsViewController = makeCarouselTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            assetType: .smallIcon(AnyValues.image),
            customControl: .navigation(makeNavigationPresetViewWithoutBagde),
            showHeadline: true
        )

        assertSnapshot(
            of: carouselTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    private func makeCarouselTestsViewController(
        title: String? = nil,
        subtitle: String? = nil,
        detailText: String? = nil,
        assetType: ListCellContentView.CellAssetType = .none,
        customControl: CarouselTestsViewController.CustomControl = .none,
        showHeadline: Bool = false,
        numberOfCells: Int = 1
    ) -> CarouselTestsViewController {
        let carouselTestsViewController = CarouselTestsViewController()

        carouselTestsViewController.text = title
        carouselTestsViewController.subtitle = subtitle
        carouselTestsViewController.detailText = detailText
        carouselTestsViewController.assetType = assetType
        carouselTestsViewController.customControl = customControl
        carouselTestsViewController.showHeadline = showHeadline
        carouselTestsViewController.numberOfCells = numberOfCells

        return carouselTestsViewController
    }
}

private extension CarouselTests {
    func makeNavigationPresetViewWithoutBagde() -> NavigationPresetView {
        let navigationPreset = NavigationPresetView()
        navigationPreset.isBadgeHidden = true
        return navigationPreset
    }
}

private class CarouselTestsViewController: UIViewController, UICollectionViewDataSource {
    enum CustomControl {
        case none
        case navigation(() -> NavigationPresetView)
        case custom(() -> UIView)
    }

    // Cell config
    var text: String?
    var detailText: String?
    var subtitle: String?
    var showHeadline = false
    var assetType = ListCellContentView.CellAssetType.none
    var customControl = CustomControl.none
    var cellLayoutStyle = ListCellContentView.CellStyle.boxed
    var numberOfCells = 1

    private lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        ListCollectionViewCell.registerClassForCell(to: collectionView)
        return collectionView
    }()

    private lazy var layout: UICollectionViewFlowLayout = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return layout
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background

        view.addSubview(collectionView, constraints: [
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfCells
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ListCollectionViewCell.dequeueReusableCell(for: indexPath, from: collectionView)

        cell.listCellContentView.title = text
        cell.listCellContentView.subtitle = subtitle
        cell.listCellContentView.assetType = assetType
        cell.listCellContentView.cellStyle = cellLayoutStyle

        if showHeadline {
            cell.listCellContentView.headlineView = TagView(text: "HEADLINE")
        }

        switch customControl {
        case .none:
            cell.listCellContentView.controlView = nil
        case .navigation(let makeNavigationPreset):
            cell.listCellContentView.controlView = makeNavigationPreset()
        case .custom(let makeCustomControl):
            cell.listCellContentView.controlView = makeCustomControl()
        }

        return cell
    }
}

extension CarouselTests {
    enum AnyValues {
        static let title = "Any title"
        static let subtitle = "Any subtitle"
        static let image = UIImage(color: .green)
    }
}
