import UIKit
import Foundation

class ListFragmentView: UIView {
    struct ItemSelected {
        let itemId: String
        let contentId: String
        let autoSubmit: Bool
    }
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 16, left: 0, bottom: 0, right: 16)
        return stackView
    }()
    
    private let sheetList: SheetList
    
    private weak var selectedRow: SingleSelectionRowView?
    private var delegate: (String, String, Bool) -> Void
    
    init(
        sheetList: SheetList,
        didTapItem: @escaping (String, String, Bool) -> Void
    ) {
        self.sheetList = sheetList
        self.delegate = didTapItem
        
        super.init(frame: .zero)
        
        setUp()
    }
    
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
            stackView.addArrangedSubview(rowView)
        }
    }
    
    func fillListWithInformativeItems(_ items: [InformativeItem]) {
        for item in items {
            let rowView = InformativeRow(item: item)
            
            let itemTapGesture = UITapGestureRecognizer(
                target: self,
                action: #selector(selectItem(_:))
            )
            rowView.addGestureRecognizer(itemTapGesture)
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
        guard let tappedView = sender.view as? SingleSelectionRowView else { return }

        if !tappedView.isSelected {
            selectedRow?.isSelected = false
            tappedView.isSelected = true
            selectedRow = tappedView
        }
        
        delegate(sheetList.id, tappedView.item.id, sheetList.autoSubmit)
    }
}
