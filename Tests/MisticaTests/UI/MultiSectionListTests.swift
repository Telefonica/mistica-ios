//
//  MultiSectionListTests.swift
//  Mistica
//
//  Created by Daniel Illescas Romero-local on 13/1/26.
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
        let listTestsViewController = makeMultiSectionListTestsViewController(numberOfRows: 2)

        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe),
            named: "1"
        )
        
        listTestsViewController.listView.reloadData()
        
        assertSnapshot(
            of: listTestsViewController,
            as: .image(on: .iPhoneSe),
            named: "1"
        )
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

private class MultiSectionListsTestsViewController: UIViewController, UITableViewDataSource {
    let listView: ListTableView
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListTableViewCell.dequeueReusableCell(for: indexPath, from: tableView)

        switch indexPath.section {
        case 0:
            cell.listCellContentView.title = "Aaa"
            cell.listCellContentView.subtitle = nil
            cell.listCellContentView.detailText = nil
            cell.listCellContentView.assetType = .smallIcon(UIImage(color: .green))
        case 1:
            cell.listCellContentView.title = "Aaa"
            cell.listCellContentView.subtitle = "Bbb"
            cell.listCellContentView.detailText = "Ccc"
            cell.listCellContentView.assetType = .smallIcon(UIImage(color: .red))
        default:
            fatalError()
        }

        return cell
    }
}

