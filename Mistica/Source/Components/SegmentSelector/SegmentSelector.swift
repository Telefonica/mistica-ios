//
//  SegmentSelector.swift
//  Mistica
//
//  Created by cestebanez on 28/10/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

/// The different segment rendering modes supported by `SegmentSelector`.
private enum SegmentsContentMode {
    case leading
    case center
}

/// The SegmentSelectorDelegate protocol defines methods that allow you to manage the selection and deselection of
/// segments in a `SegmentSelector`. The methods of this protocol are all optional.
public protocol SegmentSelectorDelegate: AnyObject {
    func segmentSelector(_ segmentSelector: SegmentSelector, didProgramaticallySelectSegment segment: Segment)
    func segmentSelector(_ segmentSelector: SegmentSelector, didManuallySelectSegment segment: Segment)
    func segmentSelector(_ segmentSelector: SegmentSelector, didDeselectSegment segment: Segment)
}

/// Provide default empty implementations for all methods.
public extension SegmentSelectorDelegate {
    func segmentSelector(_: SegmentSelector, didProgramaticallySelectSegment _: Segment) {}
    func segmentSelector(_: SegmentSelector, didManuallySelectSegment _: Segment) {}
    func segmentSelector(_: SegmentSelector, didDeselectSegment _: Segment) {}
}

/// `SegmentSelector` is used to render a scrollable selector that will typically be placed below the navigation bar,
/// and which is used to let the user select one segment among a list of them. You will typically use the selected
/// segment to filter or categorize the content below.
public class SegmentSelector: UIView {
    private enum Constants {
        /// This component has a fixed height.
        static let componentHeight: CGFloat = 49
        static let contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        static let intersegmentSpacing: CGFloat = 8
        static let estimatedItemSize = CGSize(width: 100, height: 33)
    }

    // Layout is initialized to a default UICollectionViewFlowLayout. It will be overriden during set up phase.
    private var layout = UICollectionViewFlowLayout()
    private let collectionView: UICollectionView
    private let bottomSeparator: UIImageView

    /// Set this delegate to receive notifications about selection/deselection of segments
    public weak var delegate: SegmentSelectorDelegate?

    /// The list of segments shown by the component. Setting this property causes the component to reload.
    public var segments: [Segment] = [] {
        didSet {
            reloadContent()
        }
    }

    /// The currently selected segment, or `nil` if none is selected.
    ///
    /// Read only: to programmatically select a particular segment use `select(_)`.
    public var selectedSegment: Segment? {
        guard let index = selectedSegmentIndex else { return nil }
        guard let segment = segment(atIndex: index) else {
            assertionFailure("Error: Inconsistency between the dataset and UI. The selected item doesn't exist in the datasource. Selected cell index: \(index); current datasource: \(segments)")
            return nil
        }
        return segment
    }

    /// The mode in which the segments will be rendered.
    ///
    /// There are two modes of displaying the segments inside a `SegmentSelector`:
    /// - `leading`: Segments are always aligned to the left of the screen.
    /// - `center`: When the bounds of the component are bigger than the `contentSize`
    ///  plus the separators and insets, segments will be rendered in the center of the
    ///  component.
    private var segmentsContentMode: SegmentsContentMode = .leading

    public init(segments: [Segment]) {
        self.segments = segments
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        bottomSeparator = UIImageView(image: UIImage(color: .navigationBarDivider))

        super.init(frame: .zero)

        commonInit()
    }

    required init?(coder: NSCoder) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        bottomSeparator = UIImageView(image: UIImage(color: .navigationBarDivider))

        super.init(coder: coder)

        commonInit()
    }

    private func commonInit() {
        setUpSegmentsContentMode(for: traitCollection)
        setUpLayout(for: segmentsContentMode)
        setUpCollectionView()

        // Listen to theme variant changes
        NotificationCenter.default.addObserver(self, selector: #selector(themeDidChange), name: .themeVariantDidChange, object: nil)
    }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.horizontalSizeClass != previousTraitCollection?.horizontalSizeClass else { return }
        setUpSegmentsContentMode(for: traitCollection)
        setUpLayout(for: segmentsContentMode)
    }
}

// MARK: Public API

public extension SegmentSelector {
    /// Use this method to programatically select a Segment.
    ///
    /// Calling this method causes `segment` to be selected if it exists. Otherwise, nothing will happen.
    ///
    /// This method causes the appropiated selection-related delegate methods to be called. This is different from the
    /// standard behavior of a UICollectionView for example.
    func select(_ segment: Segment) {
        guard segment != selectedSegment else { return } // Ignore reselections
        guard let selectIdx = segments.firstIndex(where: { $0 == segment }) else { return }

        // Deselection
        if let deselectIdx = selectedSegmentIndex {
            deselectCellNotifyingDelegate(at: IndexPath(item: deselectIdx, section: 0))
        }

        // Selection
        let indexPath = IndexPath(item: selectIdx, section: 0)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        selectCellNotifyingProgrammaticSelection(at: indexPath)
    }
}

// MARK: UICollectionViewDataSource

extension SegmentSelector: UICollectionViewDataSource {
    public func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        segments.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let segment = segment(atIndex: indexPath.item) else {
            fatalError("Inconsistency between the collectionView and it's dataSource: Trying to fetch cell for item at indexPath \(indexPath), but the index was not valid. Current segment list: \(segments)")
        }
        let segmentCell = SegmentCell.dequeueReusableCell(for: indexPath, from: collectionView)
        segmentCell.show(title: segment.title)
        segmentCell.isSelected ? segmentCell.showSelected() : segmentCell.showDeselected()
        segmentCell.accessibilityIdentifier = segment.accessibilityIdentifier
        return segmentCell
    }
}

// MARK: UICollectionViewDelegate

extension SegmentSelector: UICollectionViewDelegate {
    public func collectionView(_: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        // We allow selection only when the cell is not already selected.
        indexPath.item != selectedSegmentIndex
    }

    public func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectCellNotifyingUserSelection(at: indexPath)
    }

    public func collectionView(_: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        deselectCellNotifyingDelegate(at: indexPath)
    }
}

// MARK: UILargeContentViewerInteractionDelegate

@available(iOS 13, *)
extension SegmentSelector: UILargeContentViewerInteractionDelegate {
    public func largeContentViewerInteraction(_: UILargeContentViewerInteraction, didEndOn item: UILargeContentViewerItem?, at _: CGPoint) {
        guard let cell = item as? SegmentCell,
            let indexPath = collectionView.indexPath(for: cell),
            let segment = segment(atIndex: indexPath.item) else { return }

        select(segment)
    }
}

// MARK: Private

private extension SegmentSelector {
    func setUpSegmentsContentMode(for traitCollection: UITraitCollection) {
        switch traitCollection.horizontalSizeClass {
        case .regular:
            segmentsContentMode = .center
        case .compact,
             .unspecified:
            segmentsContentMode = .leading
        @unknown default:
            segmentsContentMode = .leading
        }
    }

    func setUpLayout(for segmentsContentMode: SegmentsContentMode) {
        switch segmentsContentMode {
        case .leading:
            layout = UICollectionViewFlowLayout()
        case .center:
            layout = SegmentSelectorCenteredContentLayout()
        }
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = Constants.intersegmentSpacing
        layout.minimumInteritemSpacing = Constants.intersegmentSpacing
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = Constants.estimatedItemSize
        collectionView.collectionViewLayout = layout
    }

    func setUpCollectionView() {
        collectionView.backgroundColor = .navigationBarBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.contentInset = Constants.contentInset

        addSubview(bottomSeparator, constraints: [
            bottomSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: bottomSeparator.trailingAnchor),
            bottomAnchor.constraint(equalTo: bottomSeparator.bottomAnchor)
        ])

        addSubview(collectionView, constraints: [
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            bottomSeparator.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            // The height of this component is pinned. Instead of Using Dynamic Type, it shows a HUD on long press
            collectionView.heightAnchor.constraint(equalToConstant: Constants.componentHeight)
        ])

        // Add the appropriate interaction to allow showing large content on HUD when the user long presses the
        // component. This accesibility solution is only offered in iOS 13.
        if #available(iOS 13, *) {
            let largeContentInteraction = UILargeContentViewerInteraction(delegate: self)
            collectionView.addInteraction(largeContentInteraction)
        }

        collectionView.dataSource = self
        collectionView.delegate = self

        SegmentCell.registerClassForCell(to: collectionView)
    }

    func selectCellNotifyingProgrammaticSelection(at indexPath: IndexPath) {
        selectCell(at: indexPath)
        notifyProgrammaticSelection(at: indexPath)
    }

    func selectCellNotifyingUserSelection(at indexPath: IndexPath) {
        selectCell(at: indexPath)
        notifyUserSelection(at: indexPath)
    }

    func deselectCellNotifyingDelegate(at indexPath: IndexPath) {
        deselectCell(at: indexPath)
        notifySegmentDeselection(at: indexPath)
    }

    func selectCell(at indexPath: IndexPath) {
        adjustContentOffsetIfNeeded(in: collectionView, forCellSelectedAt: indexPath)
        guard let segmentCell = collectionView.cellForItem(at: indexPath) as? SegmentCell else { return }
        segmentCell.showSelected()
    }

    func deselectCell(at indexPath: IndexPath) {
        guard let segmentCell = collectionView.cellForItem(at: indexPath) as? SegmentCell else { return }
        segmentCell.showDeselected()
    }

    func notifyProgrammaticSelection(at indexPath: IndexPath) {
        guard let segment = segment(atIndex: indexPath.item) else { return }
        delegate?.segmentSelector(self, didProgramaticallySelectSegment: segment)
    }

    func notifyUserSelection(at indexPath: IndexPath) {
        guard let segment = segment(atIndex: indexPath.item) else { return }
        delegate?.segmentSelector(self, didManuallySelectSegment: segment)
    }

    func notifySegmentDeselection(at indexPath: IndexPath) {
        guard let segment = segment(atIndex: indexPath.item) else { return }
        delegate?.segmentSelector(self, didDeselectSegment: segment)
    }

    /// Adjusts the content offset so if the selected cell is slightly out of the screen, the collectionView will
    /// scroll to make it totally visible.
    func adjustContentOffsetIfNeeded(in collectionView: UICollectionView, forCellSelectedAt indexPath: IndexPath) {
        // Force a layout pass immediately, since we depend on the attributes to perform contentOffset adjustments, and
        // this method might be called right after a layout invalidation.
        // For example, the first time SegmentSelector appear on screen, we want to set the initial list of segments (this
        // calls reloadData and invalidateLayout), and then we might also want to preselect a segment (i.e. deeplink with
        // categoryId parameter). In that case, we need to force layout or the attributes of the item won't be calculated yet.
        collectionView.layoutIfNeeded()

        guard let layoutAttributes = collectionView.layoutAttributesForItem(at: indexPath) else { return }
        let cellFrame = layoutAttributes.frame

        let cellStartMinusInsets = cellFrame.minX - Constants.contentInset.left
        let cellEndPlusInsets = cellFrame.maxX + Constants.contentInset.right

        if cellStartMinusInsets < collectionView.contentOffset.x {
            // The cell frame starts before the current content offset, we need to scroll until the cell is
            // accomodated on the left
            collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        } else if cellEndPlusInsets > collectionView.contentOffset.x + collectionView.boundsWidth {
            // The cell frame ends beyond the current contentOffset plus the width of the collectionView, we need to
            // scroll until the cell is accomodated on the right
            collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        }
    }

    func reloadContent() {
        collectionView.reloadData()
        scrollToFirstItemIfNeeded()
    }

    func scrollToFirstItemIfNeeded() {
        guard segments.count > 0 else { return }
        let firstItem = IndexPath(item: 0, section: 0)
        // It is very important that this scroll is NOT animated. Otherwise, when transitioning from datasources with
        // many cells and which have been scrolled a long way to the right (i.e. the contentOffset is a big number),
        // and we transition to another datasource, the scroll animation triggers visibility events on the intermediate
        // cells, which end up trying to compute layouts for cells that don't exist anymore after the reload.
        collectionView.scrollToItem(at: firstItem, at: .left, animated: false)
    }

    var selectedSegmentIndex: Int? {
        collectionView.indexPathsForSelectedItems?.first?.item
    }

    func segment(atIndex index: Int) -> Segment? {
        guard segments.indices.contains(index) else { return nil }
        return segments[index]
    }
}

// MARK: Theme Variant did change notification

@objc extension SegmentSelector {
    func themeDidChange() {
        collectionView.backgroundColor = .navigationBarBackground
        bottomSeparator.image = UIImage(color: .navigationBarDivider)
        reloadContent()
    }
}
