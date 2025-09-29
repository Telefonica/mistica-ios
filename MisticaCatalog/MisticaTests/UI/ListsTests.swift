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

@MainActor
final class ListsTests: XCTestCase {
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

    func testCellDefaultConfigAndImage() {
        let listTestsViewController = makeListTestsViewController(assetType: .custom(.image(AnyValues.image)))

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellDefaultConfigAndImageWithCustomSize() {
        let listTestsViewController = makeListTestsViewController(assetType: .custom(.image(AnyValues.image), size: CGSize(width: 100, height: 40)))

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellDefaultConfigAndSmallIcon() {
        let listTestsViewController = makeListTestsViewController(assetType: .smallIcon(AnyValues.image))

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellDefaultConfigAndLargeIcon() {
        let listTestsViewController = makeListTestsViewController(assetType: .largeIcon(AnyValues.image, backgroundColor: .blue))

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellDefaultConfigAndLargeIconAndControlView() {
        let listTestsViewController = makeListTestsViewController(
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue),
            customControl: .custom(makeCustomControlView)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    // MARK: - Only Title

    func testCellWithTitle() {
        let listTestsViewController = makeListTestsViewController(title: AnyValues.title)

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndImage() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            assetType: .custom(.image(AnyValues.image))
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndImageWithCustomSize() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            assetType: .custom(.image(AnyValues.image), size: CGSize(width: 100, height: 40))
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndSmallIcon() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            assetType: .smallIcon(AnyValues.image)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndLargeIcon() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndLargeIconAndControlView() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue),
            customControl: .custom(makeCustomControlView)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    // MARK: - Title and Subtitle

    func testCellWithTitleAndSubtitle() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndSubtitleAndImage() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            assetType: .custom(.image(AnyValues.image))
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndSubtitleAndImageWithCustomSize() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            assetType: .custom(.image(AnyValues.image), size: CGSize(width: 100, height: 40))
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndSubtitleAndSmallIcon() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            assetType: .smallIcon(AnyValues.image)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndSubtitleAndLargeIcon() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndSubtitleAndLargeIconAndControlView() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue),
            customControl: .custom(makeCustomControlView)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    // MARK: - Title and Detail text

    func testCellWithTitleAndDetailText() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            detailText: AnyValues.detailText
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndDetailTextAndImage() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            detailText: AnyValues.detailText,
            assetType: .custom(.image(AnyValues.image))
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndDetailTextAndImageWithCustomSize() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            detailText: AnyValues.detailText,
            assetType: .custom(.image(AnyValues.image), size: CGSize(width: 100, height: 40))
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndDetailTextAndSmallIcon() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            detailText: AnyValues.detailText,
            assetType: .smallIcon(AnyValues.image)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndDetailTextAndLargeIcon() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            detailText: AnyValues.detailText,
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithTitleAndDetailTextAndLargeIconAndControlView() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            detailText: AnyValues.detailText,
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue),
            customControl: .custom(makeCustomControlView)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    // MARK: - All labels

    func testCellWithAllLabels() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithAllLabelsAndImage() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            assetType: .custom(.image(AnyValues.image))
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithAllLabelsAndImageWithCustomSize() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            assetType: .custom(.image(AnyValues.image), size: CGSize(width: 100, height: 40))
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
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
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
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
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithAllLabelsAndLargeIconAndControlView() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            assetType: .largeIcon(AnyValues.image, backgroundColor: .blue),
            customControl: .custom(makeCustomControlView)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    // MARK: - Headline

    func testCellWithTitleAndHeadline() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            showHeadline: true
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithAllLabelsAndHeadline() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            showHeadline: true
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithAllLabelsAndHeadlineAndImage() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            assetType: .custom(.image(AnyValues.image)),
            showHeadline: true
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithAllLabelsAndHeadlineAndImageWithCustomSize() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            assetType: .custom(.image(AnyValues.image), size: CGSize(width: 100, height: 40)),
            showHeadline: true
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithAllLabelsAndHeadlineAndImageAndControlView() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            assetType: .custom(.image(AnyValues.image)),
            customControl: .custom(makeCustomControlView),
            showHeadline: true
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithAllLabelsAndHeadlineAndImageWithCustomSizeAndControlView() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            assetType: .custom(.image(AnyValues.image), size: CGSize(width: 60, height: 20)),
            customControl: .custom(makeCustomControlView),
            showHeadline: true
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    // MARK: - Navigation preset

    func testCellWithTitleAndNavigationPresetWithoutBadge() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            customControl: .navigation(makeNavigationPresetViewWithoutBagde)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithAllLabelsAndNavigationPresetWithoutBadge() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            customControl: .navigation(makeNavigationPresetViewWithoutBagde)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithAllLabelsAndNavigationPresetWithoutNavigationIcon() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            customControl: .navigation(makeNavigationPresetViewWithoutNavigationIcon)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithAllLabelsAndNavigationPresetWithFlagBadge() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            customControl: .navigation(makeNavigationPresetViewWithFlagBagde)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithAllLabelsAndNavigationPresetWithNumericBadge() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            customControl: .navigation(makeNavigationPresetViewWithNumericBagde)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithAllLabelsAndNavigationPresetWithNumericBadgeWithValueMajorThanTen() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            customControl: .navigation(makeNavigationPresetViewWithNumericBagdeValueMajorThanTen)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    // MARK: - Vertically centered preset

    func testCellWithTitleAndVerticallyCenteredPreset() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            customControl: .custom(makeVerticallyCenteredPreset)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithAllLabelsAndVerticallyCenteredPreset() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            customControl: .custom(makeVerticallyCenteredPreset)
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testCellWithAllLabelsAndVerticallyCenteredPresetMoreThanOne() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            customControl: .custom(makeVerticallyCenteredPreset),
            numberOfRows: 3
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    // MARK: - Multilines test

    func testAllLabelsWithMultilines() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.titleMultiline,
            subtitle: AnyValues.subtitleMultiline,
            detailText: AnyValues.detailTextMultiline
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testAllLabelsWithMultilinesAndHeadlineAndImageAndNavigationPreset() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.titleMultiline,
            subtitle: AnyValues.subtitleMultiline,
            detailText: AnyValues.detailTextMultiline,
            assetType: .custom(.image(AnyValues.image)),
            customControl: .navigation(makeNavigationPresetViewWithoutBagde),
            showHeadline: true
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testAllLabelsWithMultilinesAndHeadlineAndImageAndNavigationPresetMoreThanOneRow() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitleMultiline,
            detailText: AnyValues.detailTextMultiline,
            assetType: .custom(.image(AnyValues.image)),
            customControl: .navigation(makeNavigationPresetViewWithoutBagde),
            showHeadline: true,
            numberOfRows: 3
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    // MARK: - Boxed style

    func testCellWithTitleAndBoxedStyle() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            cellLayoutStyle: .boxed
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testAllLabelsAndBoxedStyleMoreThanOneRow() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.titleMultiline,
            subtitle: AnyValues.subtitleMultiline,
            detailText: AnyValues.detailTextMultiline,
            cellLayoutStyle: .boxed,
            numberOfRows: 3
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testAllLabelsAndVerticallyPresetAndBoxedStyleMoreThanOneRow() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.titleMultiline,
            subtitle: AnyValues.subtitleMultiline,
            detailText: AnyValues.detailTextMultiline,
            customControl: .custom(makeVerticallyCenteredPreset),
            cellLayoutStyle: .boxed,
            numberOfRows: 3
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testAllLabelsWithMultilinesAndHeadlineAndImageAndNavigationPresetAndBoxedStyleMoreThanOneRow() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitleMultiline,
            detailText: AnyValues.detailTextMultiline,
            assetType: .custom(.image(AnyValues.image)),
            customControl: .navigation(makeNavigationPresetViewWithoutBagde),
            showHeadline: true,
            cellLayoutStyle: .boxed,
            numberOfRows: 3
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    // MARK: - Boxed inverse style

    func testCellWithTitleAndBoxedInverseStyle() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            cellLayoutStyle: .boxedInverse
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testAllLabelsAndBoxedInverseStyleMoreThanOneRow() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.titleMultiline,
            subtitle: AnyValues.subtitleMultiline,
            detailText: AnyValues.detailTextMultiline,
            cellLayoutStyle: .boxedInverse,
            numberOfRows: 3
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testAllLabelsAndVerticallyPresetAndBoxedInverseStyleMoreThanOneRow() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.titleMultiline,
            subtitle: AnyValues.subtitleMultiline,
            detailText: AnyValues.detailTextMultiline,
            customControl: .custom(makeVerticallyCenteredPreset),
            cellLayoutStyle: .boxedInverse,
            numberOfRows: 3
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    func testAllLabelsWithMultilinesAndHeadlineAndImageAndNavigationPresetAndBoxedInverseStyleMoreThanOneRow() {
        let listTestsViewController = makeListTestsViewController(
            title: AnyValues.title,
            subtitle: AnyValues.subtitleMultiline,
            detailText: AnyValues.detailTextMultiline,
            assetType: .custom(.image(AnyValues.image)),
            customControl: .navigation(makeNavigationPresetViewWithoutBagde),
            showHeadline: true,
            cellLayoutStyle: .boxedInverse,
            numberOfRows: 3
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    // MARK: - Highlight Cell Tests

    func testCellHighlightedFullWidthStyle() {
        let cell = makeTestCell(title: AnyValues.title, cellStyle: .fullWidth)
        cell.setHighlighted(true, animated: false)

        assertSnapshot(
            of: cell,
            as: .image(drawHierarchyInKeyWindow: true, size: CGSize(width: 375, height: 150))
        )
    }

    func testCellHighlightedBoxedStyle() {
        let cell = makeTestCell(title: AnyValues.title, cellStyle: .boxed)
        cell.setHighlighted(true, animated: false)

        assertSnapshot(
            of: cell,
            as: .image(drawHierarchyInKeyWindow: true, size: CGSize(width: 375, height: 150))
        )
    }

    func testCellHighlightedBoxedInverseStyle() {
        let cell = makeTestCell(title: AnyValues.title, cellStyle: .boxedInverse)
        cell.setHighlighted(true, animated: false)

        assertSnapshot(
            of: cell,
            as: .image(drawHierarchyInKeyWindow: true, size: CGSize(width: 375, height: 150))
        )
    }

    // MARK: - Highlight with Complex Combinations

    func testCellHighlightedWithMultilineAndAllFeatures() {
        let cell = makeTestCell(
            title: AnyValues.titleMultiline,
            assetType: .custom(.image(AnyValues.image)),
            customControl: .navigation(makeNavigationPresetViewWithoutBagde),
            showHeadline: true,
            cellStyle: .boxedInverse
        )
        cell.setHighlighted(true, animated: false)

        assertSnapshot(
            of: cell,
            as: .image(drawHierarchyInKeyWindow: true, size: CGSize(width: 375, height: 150))
        )
    }

    // MARK: - XIB integration

    func testXIBIntegration() {
        let view = ListsXIBIntegration.viewFromNib()

        let listTestsViewController = makeListTestsViewController(
            listView: view.listView,
            title: AnyValues.title,
            subtitle: AnyValues.subtitle,
            detailText: AnyValues.detailText,
            assetType: .custom(.image(AnyValues.image)),
            customControl: .custom(makeCustomControlView),
            showHeadline: true,
            cellLayoutStyle: .fullWidth
        )

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true)
        )
    }

    // MARK: - Font colors based on brands

    func testAllLabelsFontColors() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeListTestsViewController(
                title: AnyValues.title,
                subtitle: AnyValues.subtitle,
                detailText: AnyValues.detailText
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
        static let image = UIImage(color: .green)
    }

    private func makeListTestsViewController(
        listView: ListTableView = ListTableView(),
        title: String? = nil,
        subtitle: String? = nil,
        detailText: String? = nil,
        assetType: ListCellContentView.CellAssetType = .none,
        customControl: ListsTestsViewController.CustomControl = .none,
        showHeadline: Bool = false,
        cellLayoutStyle: ListCellContentView.CellStyle = .fullWidth,
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

    private func makeTestCell(
        title: String? = nil,
        subtitle: String? = nil,
        detailText: String? = nil,
        assetType: ListCellContentView.CellAssetType = .none,
        customControl: ListsTestsViewController.CustomControl = .none,
        showHeadline: Bool = false,
        cellStyle: ListCellContentView.CellStyle = .fullWidth
    ) -> ListTableViewCell {
        let cell = ListTableViewCell(style: .default, reuseIdentifier: "testCell")

        cell.listCellContentView.title = title
        cell.listCellContentView.subtitle = subtitle
        cell.listCellContentView.detailText = detailText
        cell.listCellContentView.assetType = assetType
        cell.listCellContentView.cellStyle = cellStyle

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

        cell.frame = CGRect(x: 0, y: 0, width: 375, height: 150)
        cell.layoutIfNeeded()

        return cell
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
    var assetType = ListCellContentView.CellAssetType.none
    var customControl = CustomControl.none
    var cellLayoutStyle = ListCellContentView.CellStyle.fullWidth

    private let listView: ListTableView
    var numberOfRows = 1

    init(listView: ListTableView) {
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
        ListTableViewCell.register(on: listView)
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListTableViewCell.dequeueReusableCell(for: indexPath, from: tableView)

        cell.listCellContentView.title = text
        cell.listCellContentView.subtitle = subtitle
        cell.listCellContentView.detailText = detailText
        cell.listCellContentView.assetType = assetType
        cell.listCellContentView.subtitle = subtitle
        cell.listCellContentView.cellStyle = cellLayoutStyle
        cell.isCellSeparatorHidden = false

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
