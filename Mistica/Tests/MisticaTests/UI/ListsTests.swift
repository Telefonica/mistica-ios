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

    // Default config
    
    func testCellDefaultConfig() {
        let listTestsViewController = makeListTestsViewController()
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellDefaultConfigAndImage() {
        let listTestsViewController = makeListTestsViewController(assetType: .image(AnyValues.image))
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellDefaultConfigAndSmallIcon() {
        let listTestsViewController = makeListTestsViewController(assetType: .smallIcon(AnyValues.image))
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellDefaultConfigAndLargeIcon() {
        let listTestsViewController = makeListTestsViewController(assetType: .largeIcon(AnyValues.image, backgroundColor: .blue))

        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellDefaultConfigAndLargeIconAndControlView() {
        let listTestsViewController = makeListTestsViewController(
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue),
            customControl: .custom(makeCustomControlView())
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    // Only Title
    
    func testCellWithTitle() {
        let listTestsViewController = makeListTestsViewController(title: AnyValues.title)
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithTitleAndImage() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            assetType: .image(AnyValues.image)
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithTitleAndSmallIcon() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            assetType: .smallIcon(AnyValues.image)
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithTitleAndLargeIcon() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue)
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithTitleAndLargeIconAndControlView() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue),
            customControl: .custom(makeCustomControlView())
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    // Title and Subtitle
    
    func testCellWithTitleAndSubtitle() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithTitleAndSubtitleAndImage() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            assetType: .image(AnyValues.image)
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithTitleAndSubtitleAndSmallIcon() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            assetType: .smallIcon(AnyValues.image)
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithTitleAndSubtitleAndLargeIcon() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue)
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithTitleAndSubtitleAndLargeIconAndControlView() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue),
            customControl: .custom(makeCustomControlView())
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    // Title and Detail text
    
    func testCellWithTitleAndDetailText() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            detailText: AnyValues.detailText
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithTitleAndDetailTextAndImage() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            detailText: AnyValues.detailText,
            assetType: .image(AnyValues.image)
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithTitleAndDetailTextAndSmallIcon() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            detailText: AnyValues.detailText,
            assetType: .smallIcon(AnyValues.image)
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithTitleAndDetailTextAndLargeIcon() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            detailText: AnyValues.detailText,
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue)
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithTitleAndDetailTextAndLargeIconAndControlView() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            detailText: AnyValues.detailText,
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue),
            customControl: .custom(makeCustomControlView())
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    // All labels
    
    func testCellWithAllLabels() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithAllLabelsAndImage() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            assetType: .image(AnyValues.image)
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithAllLabelsAndSmallIcon() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            assetType: .smallIcon(AnyValues.image)
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithAllLabelsAndLargeIcon() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue)
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithAllLabelsAndLargeIconAndControlView() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue),
            customControl: .custom(makeCustomControlView())
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    // All labels and headline
    
    func testCellWithAllLabelsAndHeadline() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            showHeadline: true
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithAllLabelsAndHeadlineAndImage() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            assetType: .image(AnyValues.image),
            showHeadline: true
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithAllLabelsAndHeadlineAndImageAndControlView() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            assetType: .image(AnyValues.image),
            customControl: .custom(makeCustomControlView()),
            showHeadline: true
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    // All labels and navigation preset
    
    func testCellWithAllLabelsAndNavigationPresetWithoutBadge() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            customControl: .navigation(makeNavigationPresetViewWithoutBagde())
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithAllLabelsAndNavigationPresetWithoutNavigationIcon() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            customControl: .navigation(makeNavigationPresetViewWithoutNavigationIcon())
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithAllLabelsAndNavigationPresetWithFlagBadge() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            customControl: .navigation(makeNavigationPresetViewWithFlagBagde())
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithAllLabelsAndNavigationPresetWithNumericBadge() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            customControl: .navigation(makeNavigationPresetViewWithNumericBagde(withValue: AnyValues.intValue))
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testCellWithAllLabelsAndNavigationPresetWithNumericBadgeWithValueMajorThanTen() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            customControl: .navigation(makeNavigationPresetViewWithNumericBagde(withValue: AnyValues.majorThanTenIntValue))
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    // Multilines test
    
    func testAllLabelsWithMultilines() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.titleMultiline,
            subtitle: AnyValues.subtitleMultiline,
            detailText: AnyValues.detailTextMultiline
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    func testAllLabelsWithMultilinesAndHeadlineAndImageAndNavigationPreset() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.titleMultiline,
            subtitle: AnyValues.subtitleMultiline,
            detailText: AnyValues.detailTextMultiline,
            assetType: .image(AnyValues.image),
            customControl: .navigation(makeNavigationPresetViewWithoutBagde()),
            showHeadline: true
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    // Three rows
    
    func testThreeRows() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            numberOfRows: 3
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    // Boxed style
    
    func testBoxedStyle() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            cellLayoutStyle: .boxed
        )
        
        assertSnapshot(
            matching: listTestsViewController,
            as: .image
        )
    }
    
    // MARK: XIB integration

    func testXIBIntegration() {
        let view = ListsXIBIntegration.viewFromNib()
        
        let listTestsViewController = makeListTestsViewController(
            listView: view.listView,
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            assetType: .image(AnyValues.image),
            customControl: .custom(makeCustomControlView()),
            showHeadline: true,
            cellLayoutStyle: .fullWidth
        )

        assertSnapshot(
            matching: listTestsViewController,
            as: .image(on: .iPhoneX)
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
        let customView = UIStackView(frame: .zero)
        customView.alignment = .bottom
        let button = Button(title: "test")
        button.isSmall = true

        customView.addArrangedSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 115).isActive = true
        
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
    
    func makeNavigationPresetViewWithNumericBagde(withValue value: Int) -> NavigationPresetView {
        let navigationPreset = NavigationPresetView()
        navigationPreset.badgeView.style = .numeric
        navigationPreset.badgeView.value = value
        navigationPreset.isBadgeHidden = false
        return navigationPreset
    }
}

private class ListsTestsViewController: UIViewController, UITableViewDataSource {
    enum CustomControl {
        case none
        case navigation(NavigationPresetView)
        case custom(UIView)
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
        case .navigation(let navigationPreset):
            cell.controlView = navigationPreset
        case .custom(let customView):
            cell.controlView = customView
        }

        return cell
    }
}
