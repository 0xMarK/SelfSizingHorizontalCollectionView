//
//  SelfSizingHorizontalCollectionView.swift
//  SelfSizingHorizontalCollectionView
//
//  Created by Anton Kaliuzhnyi on 15.11.2023.
//

import UIKit

class SelfSizingHorizontalCollectionView: UICollectionView {
    
    private var didLayoutSubviews: Bool = false
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let horizontalLayout = UICollectionViewFlowLayout()
        horizontalLayout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: horizontalLayout)
    }
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let horizontalLayout = UICollectionViewFlowLayout()
        horizontalLayout.scrollDirection = .horizontal
        collectionViewLayout = horizontalLayout
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    override func layoutSubviews() {
        setupEstimatedItemSize()
        super.layoutSubviews()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if (object as? UICollectionView) == self,
           keyPath == "contentSize" {
            setupCollectionViewHeight()
        }
    }
    
    func setupEstimatedItemSize() {
        let layout = collectionViewLayout as? UICollectionViewFlowLayout
        if dataSource?.collectionView(self, numberOfItemsInSection: 0) == 1 {
            let firstSize = firstItemLayoutAttributes()?.size ?? CGSize(width: 50, height: 50)
            layout?.estimatedItemSize = CGSize(width: firstSize.width, height: firstSize.height)
        } else {
            layout?.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    private func firstItemLayoutAttributes() -> UICollectionViewLayoutAttributes? {
        guard numberOfSections > 0,
              numberOfItems(inSection: 0) > 0,
              let layoutAttributes = collectionViewLayout.layoutAttributesForItem(at: IndexPath(row: 0, section: 0)),
              layoutAttributes.size.height > 0 else { return nil }
        return layoutAttributes
    }
    
    private func setupCollectionViewHeight() {
        if let firstLayoutAttributes = firstItemLayoutAttributes() {
            setupEstimatedItemSize()
            let height = firstLayoutAttributes.size.height + contentInset.top + contentInset.bottom
            let heightConstraint = constraints.first { $0.firstItem as? Self == self && $0.firstAttribute == .height }
            heightConstraint?.constant = height
        }
    }
    
}
