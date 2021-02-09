//
//  ListsTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

final class ListsTests: XCTestCase {
    override func setUp() {
        super.setUp()

        isRecording = false
    }

    // MARK: - Layout

    // MARK: - Default config

    func testCellDefaultConfig() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController()
        )
    }

    func testCellDefaultConfigAndImage() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(assetType: .image(AnyValues.image))
        )
    }

    func testCellDefaultConfigAndSmallIcon() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(assetType: .smallIcon(AnyValues.image))
        )
    }

    func testCellDefaultConfigAndLargeIcon() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(assetType: .largeIcon(AnyValues.image, backgroundColor: .blue))
        )
    }

    func testCellDefaultConfigAndLargeIconAndControlView() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                assetType: .largeIcon(AnyValues.image, backgroundColor: .blue),
                customControl: .custom(makeCustomControlView)
            )
        )
    }

    // MARK: - Only Title

    func testCellWithTitle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(title: AnyValues.title)
        )
    }

    func testCellWithTitleAndImage() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                assetType: .image(AnyValues.image)
            )
        )
    }

    func testCellWithTitleAndSmallIcon() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                assetType: .smallIcon(AnyValues.image)
            )
        )
    }

    func testCellWithTitleAndLargeIcon() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                assetType: .largeIcon(AnyValues.image, backgroundColor: .blue)
            )
        )
    }

    func testCellWithTitleAndLargeIconAndControlView() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                assetType: .largeIcon(AnyValues.image, backgroundColor: .blue),
                customControl: .custom(makeCustomControlView)
            )
        )
    }

    // MARK: - Title and Subtitle

    func testCellWithTitleAndSubtitle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle
            )
        )
    }

    func testCellWithTitleAndSubtitleAndImage() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                assetType: .image(AnyValues.image)
            )
        )
    }

    func testCellWithTitleAndSubtitleAndSmallIcon() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                assetType: .smallIcon(AnyValues.image)
            )
        )
    }

    func testCellWithTitleAndSubtitleAndLargeIcon() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                assetType: .largeIcon(AnyValues.image, backgroundColor: .blue)
            )
        )
    }

    func testCellWithTitleAndSubtitleAndLargeIconAndControlView() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                assetType: .largeIcon(AnyValues.image, backgroundColor: .blue),
                customControl: .custom(makeCustomControlView)
            )
        )
    }

    // MARK: - Title and Detail text

    func testCellWithTitleAndDetailText() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                detailText: AnyValues.detailText
            )
        )
    }

    func testCellWithTitleAndDetailTextAndImage() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                detailText: AnyValues.detailText,
                assetType: .image(AnyValues.image)
            )
        )
    }

    func testCellWithTitleAndDetailTextAndSmallIcon() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                detailText: AnyValues.detailText,
                assetType: .smallIcon(AnyValues.image)
            )
        )
    }

    func testCellWithTitleAndDetailTextAndLargeIcon() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                detailText: AnyValues.detailText,
                assetType: .largeIcon(AnyValues.image, backgroundColor: .blue)
            )
        )
    }

    func testCellWithTitleAndDetailTextAndLargeIconAndControlView() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                detailText: AnyValues.detailText,
                assetType: .largeIcon(AnyValues.image, backgroundColor: .blue),
                customControl: .custom(makeCustomControlView)
            )
        )
    }

    // MARK: - All labels

    func testCellWithAllLabels() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText
            )
        )
    }

    func testCellWithAllLabelsAndImage() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText,
                assetType: .image(AnyValues.image)
            )
        )
    }

    func testCellWithAllLabelsAndSmallIcon() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText,
                assetType: .smallIcon(AnyValues.image)
            )
        )
    }

    func testCellWithAllLabelsAndLargeIcon() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText,
                assetType: .largeIcon(AnyValues.image, backgroundColor: .blue)
            )
        )
    }

    func testCellWithAllLabelsAndLargeIconAndControlView() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText,
                assetType: .largeIcon(AnyValues.image, backgroundColor: .blue),
                customControl: .custom(makeCustomControlView)
            )
        )
    }

    // MARK: - Headline

    func testCellWithTitleAndHeadline() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                showHeadline: true
            )
        )
    }

    func testCellWithAllLabelsAndHeadline() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText,
                showHeadline: true
            )
        )
    }

    func testCellWithAllLabelsAndHeadlineAndImage() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText,
                assetType: .image(AnyValues.image),
                showHeadline: true
            )
        )
    }

    func testCellWithAllLabelsAndHeadlineAndImageAndControlView() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText,
                assetType: .image(AnyValues.image),
                customControl: .custom(makeCustomControlView),
                showHeadline: true
            )
        )
    }

    // MARK: - Navigation preset

    func testCellWithTitleAndNavigationPresetWithoutBadge() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                customControl: .navigation(makeNavigationPresetViewWithoutBagde)
            )
        )
    }

    func testCellWithAllLabelsAndNavigationPresetWithoutBadge() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText,
                customControl: .navigation(makeNavigationPresetViewWithoutBagde)
            )
        )
    }

    func testCellWithAllLabelsAndNavigationPresetWithoutNavigationIcon() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText,
                customControl: .navigation(makeNavigationPresetViewWithoutNavigationIcon)
            )
        )
    }

    func testCellWithAllLabelsAndNavigationPresetWithFlagBadge() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText,
                customControl: .navigation(makeNavigationPresetViewWithFlagBagde)
            )
        )
    }

    func testCellWithAllLabelsAndNavigationPresetWithNumericBadge() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText,
                customControl: .navigation(makeNavigationPresetViewWithNumericBagde)
            )
        )
    }

    func testCellWithAllLabelsAndNavigationPresetWithNumericBadgeWithValueMajorThanTen() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText,
                customControl: .navigation(makeNavigationPresetViewWithNumericBagdeValueMajorThanTen)
            )
        )
    }

    // MARK: - Vertically centered preset

    func testCellWithTitleAndVerticallyCenteredPreset() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                customControl: .custom(makeVerticallyCenteredPreset)
            )
        )
    }

    func testCellWithAllLabelsAndVerticallyCenteredPreset() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText,
                customControl: .custom(makeVerticallyCenteredPreset)
            )
        )
    }

    func testCellWithAllLabelsAndVerticallyCenteredPresetMoreThanOne() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText,
                customControl: .custom(makeVerticallyCenteredPreset),
                numberOfRows: 3
            )
        )
    }

    // MARK: - Multilines test

    func testAllLabelsWithMultilines() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.titleMultiline,
                subtitle: AnyValues.subtitleMultiline,
                detailText: AnyValues.detailTextMultiline
            )
        )
    }

    func testAllLabelsWithMultilinesAndHeadlineAndImageAndNavigationPreset() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.titleMultiline,
                subtitle: AnyValues.subtitleMultiline,
                detailText: AnyValues.detailTextMultiline,
                assetType: .image(AnyValues.image),
                customControl: .navigation(makeNavigationPresetViewWithoutBagde),
                showHeadline: true
            )
        )
    }

    func testAllLabelsWithMultilinesAndHeadlineAndImageAndNavigationPresetMoreThanOneRow() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitleMultiline,
                detailText: AnyValues.detailTextMultiline,
                assetType: .image(AnyValues.image),
                customControl: .navigation(makeNavigationPresetViewWithoutBagde),
                showHeadline: true,
                numberOfRows: 3
            )
        )
    }

    // MARK: - Boxed style

    func testCellWithTitleAndBoxedStyle() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                cellLayoutStyle: .boxed
            )
        )
    }

    func testAllLabelsAndBoxedStyleMoreThanOneRow() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.titleMultiline,
                subtitle: AnyValues.subtitleMultiline,
                detailText: AnyValues.detailTextMultiline,
                cellLayoutStyle: .boxed,
                numberOfRows: 3
            )
        )
    }

    func testAllLabelsAndVerticallyPresetAndBoxedStyleMoreThanOneRow() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.titleMultiline,
                subtitle: AnyValues.subtitleMultiline,
                detailText: AnyValues.detailTextMultiline,
                customControl: .custom(makeVerticallyCenteredPreset),
                cellLayoutStyle: .boxed,
                numberOfRows: 3
            )
        )
    }

    func testAllLabelsWithMultilinesAndHeadlineAndImageAndNavigationPresetAndBoxedStyleMoreThanOneRow() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitleMultiline,
                detailText: AnyValues.detailTextMultiline,
                assetType: .image(AnyValues.image),
                customControl: .navigation(makeNavigationPresetViewWithoutBagde),
                showHeadline: true,
                cellLayoutStyle: .boxed,
                numberOfRows: 3
            )
        )
    }

    // MARK: - XIB integration

    func testXIBIntegration() {
        let view = ListsXIBIntegration.viewFromNib()

        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeListTestsViewController(
                listView: view.listView,
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText,
                assetType: .image(AnyValues.image),
                customControl: .custom(makeCustomControlView),
                showHeadline: true,
                cellLayoutStyle: .fullWidth
            )
        )
    }
}

// MARK: - Helpers

extension ListsTests {
    enum AnyValues {
        static let title = "Any title"
        static let subtitle = "Any subtitle"
        static let detailText = "Any detail text"
        static let intValue = 2
        static let majorThanTenIntValue = 11
        static let titleMultiline = """
        Title line 1
        Title line 2
        """

        static let subtitleMultiline = """
        Subtitle line 1
        Subtitle line 2
        """

        static let detailTextMultiline = """
        Detail text line 1
        Detail text line 2
        """
        static var image = UIImage(color: .green)
    }

    fileprivate func makeListTestsViewController(
        listView: ListView = ListView(),
        title: String? = nil,
        subtitle: String? = nil,
        detailText: String? = nil,
        assetType: ListViewCell.CellAssetType = .none,
        customControl: ListsTestsViewController.CustomControl = .none,
        showHeadline: Bool = false,
        cellLayoutStyle: ListViewCell.CellStyle = .fullWidth,
        numberOfRows: Int = 1
    ) -> ListsTestsViewController {
        let listTestsViewController = ListsTestsViewController(listView: listView)

        listTestsViewController.text = title
        listTestsViewController.subtitle = subtitle
        listTestsViewController.detailText = detailText
        listTestsViewController.assetType = assetType
        listTestsViewController.customControl = customControl
        listTestsViewController.showHeadline = showHeadline
        listTestsViewController.cellLayoutStyle = cellLayoutStyle
        listTestsViewController.numberOfRows = numberOfRows

        return listTestsViewController
    }

    func makeCustomControlView() -> UIView {
        let customView = UIView()
        customView.backgroundColor = .yellow
        customView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        return customView
    }

    func makeNavigationPresetViewWithoutNavigationIcon() -> NavigationPresetView {
        let navigationPreset = NavigationPresetView()
        navigationPreset.isBadgeHidden = true
        navigationPreset.isNavigationIconHidden = true
        return navigationPreset
    }

    func makeNavigationPresetViewWithoutBagde() -> NavigationPresetView {
        let navigationPreset = NavigationPresetView()
        navigationPreset.isBadgeHidden = true
        return navigationPreset
    }

    func makeNavigationPresetViewWithFlagBagde() -> NavigationPresetView {
        let navigationPreset = NavigationPresetView()
        navigationPreset.badgeView.style = .flag
        navigationPreset.isBadgeHidden = false
        return navigationPreset
    }

    func makeNavigationPresetViewWithNumericBagde() -> NavigationPresetView {
        let navigationPreset = NavigationPresetView()
        navigationPreset.badgeView.style = .numeric
        navigationPreset.badgeView.value = AnyValues.intValue
        navigationPreset.isBadgeHidden = false
        return navigationPreset
    }

    func makeNavigationPresetViewWithNumericBagdeValueMajorThanTen() -> NavigationPresetView {
        let navigationPreset = NavigationPresetView()
        navigationPreset.badgeView.style = .numeric
        navigationPreset.badgeView.value = AnyValues.majorThanTenIntValue
        navigationPreset.isBadgeHidden = false
        return navigationPreset
    }

    func makeVerticallyCenteredPreset() -> VerticallyCenteredPresetView {
        let button = Button(title: "test")
        button.isSmall = true
        let verticallyCenteredPreset = VerticallyCenteredPresetView(arrangedSubview: button)
        verticallyCenteredPreset.backgroundColor = .yellow
        return verticallyCenteredPreset
    }
}

private class ListsTestsViewController: UIViewController, UITableViewDataSource {
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
    var assetType = ListViewCell.CellAssetType.none
    var customControl = CustomControl.none
    var cellLayoutStyle = ListViewCell.CellStyle.fullWidth

    private let listView: ListView
    var numberOfRows = 1

    init(listView: ListView) {
        self.listView = listView
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background

        view.addSubview(withDefaultConstraints: listView)
        listView.dataSource = self
        ListViewCell.register(on: listView)
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListViewCell.dequeueReusableCell(for: indexPath, from: tableView)

        cell.title = text
        cell.subtitle = subtitle
        cell.detailText = detailText
        cell.assetType = assetType
        cell.subtitle = subtitle
        cell.cellStyle = cellLayoutStyle
        cell.isCellSeparatorHidden = false

        if showHeadline {
            cell.headlineView = TagView(text: "HEADLINE")
        }

        switch customControl {
        case .none:
            cell.controlView = nil
        case .navigation(let makeNavigationPreset):
            cell.controlView = makeNavigationPreset()
        case .custom(let makeCustomControl):
            cell.controlView = makeCustomControl()
        }

        return cell
    }
}
