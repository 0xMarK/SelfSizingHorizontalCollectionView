//
//  CollectionViewCell.swift
//  SelfSizingHorizontalCollectionView
//
//  Created by Anton Kaliuzhnyi on 15.11.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont.preferredFont(forTextStyle: .body) // Dynamic Type Font
        titleLabel.adjustsFontForContentSizeCategory = true // Automatically Adjusts Font
    }
    
}
