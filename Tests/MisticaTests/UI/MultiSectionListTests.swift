//
//  MultiSectionListTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class MultiSectionListTests: XCTestCase {
    override func setUp() {
        super.setUp()

        MisticaConfig.brandStyle = .movistar
    }

    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    func testCellWithTextAndImage() {
        let alignments: [ListCellContentView.VerticalContentAlignment] = [
            .auto, .top, .center
        ]
        for alignment in alignments {
            let listTestsViewController = makeMultiSectionListTestsViewController(numberOfRows: 2)
            listTestsViewController.rowInfoForIndexPath = { indexPath in
                switch indexPath.section {
                case 0:
                    RowInfo(
                        cellAssetType: .smallIcon(UIImage(color: .green)),
                        title: "Aaa",
                        subtitle: nil,
                        detailText: nil,
                        verticalContentAlignment: alignment
                    )
                case 1:
                    RowInfo(
                        cellAssetType: .smallIcon(UIImage(color: .red)),
                        title: "Aaa",
                        subtitle: "Bbb",
                        detailText: "Ccc",
                        verticalContentAlignment: alignment
                    )
                default: fatalError()
                }
            }

            assertSnapshot(
                of: listTestsViewController,
                as: .image(on: .iPhoneSe),
                named: "1-\(alignment)"
            )

            listTestsViewController.listView.reloadData()

            assertSnapshot(
                of: listTestsViewController,
                as: .image(on: .iPhoneSe),
                named: "1-\(alignment)"
            )
        }
    }

    func testCellWithTextAndBigImage() {
        let alignments: [ListCellContentView.VerticalContentAlignment] = [
            .auto, .top, .center
        ]
        for alignment in alignments {
            let listTestsViewController = makeMultiSectionListTestsViewController(numberOfRows: 4)
            listTestsViewController.rowInfoForIndexPath = { indexPath in
                switch indexPath.row {
                case 0:
                    RowInfo(
                        cellAssetType: .custom(.image(UIImage(color: .green)), size: CGSize(width: 64, height: 64)),
                        title: "Aaa",
                        subtitle: "Bbb",
                        detailText: "Ccc",
                        verticalContentAlignment: alignment
                    )
                case 1:
                    RowInfo(
                        cellAssetType: .custom(.image(UIImage(color: .red)), size: CGSize(width: 64, height: 64)),
                        title: "Aaa",
                        subtitle: "Bbb",
                        detailText: nil,
                        verticalContentAlignment: alignment
                    )
                case 2:
                    RowInfo(
                        cellAssetType: .custom(.image(UIImage(color: .red)), size: CGSize(width: 64, height: 64)),
                        title: "Aaa",
                        subtitle: nil,
                        detailText: nil,
                        verticalContentAlignment: alignment
                    )
                case 3:
                    RowInfo(
                        cellAssetType: .custom(.image(UIImage(color: .red)), size: CGSize(width: 64, height: 64)),
                        title: nil,
                        subtitle: nil,
                        detailText: nil,
                        verticalContentAlignment: alignment
                    )
                default: fatalError()
                }
            }

            assertSnapshot(
                of: listTestsViewController,
                as: .image(on: .iPhoneSe),
                named: "1-\(alignment)"
            )

            listTestsViewController.listView.reloadData()

            assertSnapshot(
                of: listTestsViewController,
                as: .image(on: .iPhoneSe),
                named: "1-\(alignment)"
            )
        }
    }
}

private extension MultiSectionListTests {
    private func makeMultiSectionListTestsViewController(
        listView: ListTableView = ListTableView(),
        numberOfRows: Int = 2
    ) -> MultiSectionListsTestsViewController {
        let listTestsViewController = MultiSectionListsTestsViewController(listView: listView)
        listTestsViewController.numberOfRows = numberOfRows
        return listTestsViewController
    }
}

private struct RowInfo {
    let cellAssetType: ListCellContentView.CellAssetType
    let title: String?
    let subtitle: String?
    let detailText: String?
    let verticalContentAlignment: ListCellContentView.VerticalContentAlignment
}

private class MultiSectionListsTestsViewController: UIViewController, UITableViewDataSource {
    let listView: ListTableView
    var numberOfRows = 2
    var rowInfoForIndexPath: ((IndexPath) -> RowInfo) = { _ in
        RowInfo(
            cellAssetType: .smallIcon(UIImage(color: .green)),
            title: "Aaa",
            subtitle: "Bbb",
            detailText: "Ccc",
            verticalContentAlignment: .auto
        )
    }

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

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListTableViewCell.dequeueReusableCell(for: indexPath, from: tableView)

        let rowInfo = rowInfoForIndexPath(indexPath)
        cell.listCellContentView.title = rowInfo.title
        cell.listCellContentView.subtitle = rowInfo.subtitle
        cell.listCellContentView.detailText = rowInfo.detailText
        cell.listCellContentView.assetType = rowInfo.cellAssetType
        cell.listCellContentView.verticalContentAlignment = rowInfo.verticalContentAlignment

        return cell
    }
}
