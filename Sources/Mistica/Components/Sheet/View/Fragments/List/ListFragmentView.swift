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
        case actionList(item: ActionListItem)
        case action(item: ActionItem)
    }

    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()

    private let sheetList: SheetList

    private weak var selectedRow: SingleSelectionRowView?
    private var delegate: (ItemTappedType) -> Void

    private var longPressStartPoint: CGPoint? = nil
    private var longPressCancelled = false

    init(
        sheetList: SheetList,
        didTapItem: @escaping (ItemTappedType) -> Void
    ) {
        self.sheetList = sheetList
        delegate = didTapItem

        super.init(frame: .zero)

        commonInit()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ListFragmentView {
    func commonInit() {
        addSubview(withDefaultConstraints: stackView)

        switch sheetList.listType {
        case .singleSelection(let items):
            fillListWithSingleSelectionItems(items)
        case .actionList(let items):
            fillListWithActionItems(items)
        case .informative(let items):
            fillListWithInformativeItems(items)
        case .actions(items: let items):
            fillList(with: items)
        }

        backgroundColor = .backgroundContainer
    }

    func fillListWithSingleSelectionItems(_ items: [SingleSelectionItem]) {
        for item in items {
            let rowView = SingleSelectionRowView(item: item)

            let itemTapGesture = UILongPressGestureRecognizer(
                target: self,
                action: #selector(didTouchItem(_:))
            )
            itemTapGesture.minimumPressDuration = 0
            itemTapGesture.delegate = self
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
        for (index, item) in items.enumerated() {
            let rowView = InformativeRow(item: item)
            let isLastItem = index == items.count - 1
            addRow(rowView, withSeparator: !isLastItem)
        }
    }

    func fillListWithActionItems(_ items: [ActionListItem]) {
        for item in items {
            let rowView = ActionRow(item: item)

            let itemTapGesture = UILongPressGestureRecognizer(
                target: self,
                action: #selector(didTouchItem(_:))
            )
            itemTapGesture.minimumPressDuration = 0
            itemTapGesture.delegate = self
            rowView.addGestureRecognizer(itemTapGesture)
            stackView.addArrangedSubview(rowView)
        }
    }

    func fillList(with items: [ActionItem]) {
        let buttons = items.enumerated().map(button(at:for:))

        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true

        self.stackView.addArrangedSubview(stackView)
    }

    // MARK: User Interaction

    @objc private func didTouchItem(_ sender: UILongPressGestureRecognizer) {
        guard let touchable = sender.view as? Touchable else { return }

        let currentPoint = sender.location(in: self)

        switch sender.state {
        case .began:
            longPressCancelled = false
            longPressStartPoint = currentPoint
            touchable.touchBegan()
        case .changed:
            guard !longPressCancelled else { return }
            guard let longPressStartPoint = self.longPressStartPoint else { return }

            let distance = hypotf(Float(currentPoint.x - longPressStartPoint.x), Float(currentPoint.y - longPressStartPoint.y))
            if distance > 10 {
                longPressCancelled = true
            }

        case .possible, .failed:
            // ignores this states
            break
        case .cancelled:
            touchable.touchEnded()
        case .ended:
            touchable.touchEnded()

            guard !longPressCancelled else { return }

            if let tappedView = sender.view as? SingleSelectionRowView {
                handleSingleSelectionRowTap(tappedView)
            } else if let tappedView = sender.view as? ActionRow {
                handleActionListRowTap(tappedView)
            }
        @unknown default:
            // ignores this states
            break
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

    func handleActionListRowTap(_ tappedView: ActionRow) {
        delegate(.actionList(item: tappedView.item))
    }

    @objc
    func didTap(action button: Button) {
        guard case .actions(let items) = sheetList.listType else { return }
        let item = items[button.tag]
        delegate(.action(item: item))
    }
}

extension ListFragmentView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
}

// MARK: Utilities

private extension ListFragmentView {
    func addRow(_ row: UIView, withSeparator: Bool = false) {
        stackView.addArrangedSubview(row)

        if withSeparator {
            let separator = SeparatorView(axis: .horizontal)
            stackView.addArrangedSubview(separator)
        }
    }

    func button(at index: Int, for action: ActionItem) -> Button {
        let button = Button(
            style: action.style,
            title: action.title,
            rightImage: action.rightImage
        )
        button.tag = index
        button.addTarget(self, action: #selector(didTap(action:)), for: .touchUpInside)
        return button
    }
}
