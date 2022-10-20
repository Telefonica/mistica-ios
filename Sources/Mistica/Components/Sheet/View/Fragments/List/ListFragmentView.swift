//
//  ListFragmentView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

class ListFragmentView: UIView {
    struct ItemSelected {
        let itemId: String
        let contentId: String
        let autoSubmit: Bool
    }

    enum ItemTappedType {
        case singleSelection(item: SingleSelectionItem)
        case informative(item: InformativeItem)
        case action(item: ActionItem)
    }

    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 16, left: 0, bottom: 0, right: 0)
        return stackView
    }()

    private let sheetList: SheetList

    private weak var selectedRow: SingleSelectionRowView?
    private var delegate: (ItemTappedType) -> Void

    init(
        sheetList: SheetList,
        didTapItem: @escaping (ItemTappedType) -> Void
    ) {
        self.sheetList = sheetList
        delegate = didTapItem

        super.init(frame: .zero)

        setUp()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ListFragmentView {
    func setUp() {
        addSubview(withDefaultConstraints: stackView)

        switch sheetList.listType {
        case .singleSelection(let items):
            fillListWithSingleSelectionItems(items)
        case .actions(let items):
            fillListWithActionItems(items)
        case .informative(let items):
            fillListWithInformativeItems(items)
        }
    }

    func fillListWithSingleSelectionItems(_ items: [SingleSelectionItem]) {
        for item in items {
            let rowView = SingleSelectionRowView(item: item)

            let itemTapGesture = UITapGestureRecognizer(
                target: self,
                action: #selector(selectItem(_:))
            )
            rowView.addGestureRecognizer(itemTapGesture)

            if sheetList.selectedId.contains(item.id) {
                rowView.isSelected = true
                selectedRow?.isSelected = false
                selectedRow = rowView
            }

            stackView.addArrangedSubview(rowView)
        }
    }

    func fillListWithInformativeItems(_ items: [InformativeItem]) {
        for item in items {
            let rowView = InformativeRow(item: item)
            stackView.addArrangedSubview(rowView)
        }
    }

    func fillListWithActionItems(_ items: [ActionItem]) {
        for item in items {
            let rowView = ActionRow(item: item)

            let itemTapGesture = UITapGestureRecognizer(
                target: self,
                action: #selector(selectItem(_:))
            )
            rowView.addGestureRecognizer(itemTapGesture)
            stackView.addArrangedSubview(rowView)
        }
    }

    @objc private func selectItem(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view as? SingleSelectionRowView {
            handleSingleSelectionRowTap(tappedView)
        } else if let tappedView = sender.view as? ActionRow {
            handleActionsRowTap(tappedView)
        }
    }

    func handleSingleSelectionRowTap(_ tappedView: SingleSelectionRowView) {
        if !tappedView.isSelected {
            selectedRow?.isSelected = false
            tappedView.isSelected = true
            selectedRow = tappedView
        }

        delegate(.singleSelection(item: tappedView.item))
    }

    func handleActionsRowTap(_ tappedView: ActionRow) {
        delegate(.action(item: tappedView.item))
    }
}
