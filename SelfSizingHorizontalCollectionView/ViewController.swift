//
//  ViewController.swift
//  SelfSizingHorizontalCollectionView
//
//  Created by Anton Kaliuzhnyi on 15.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var items: [String] = []
    
    var horizontalInset: CGFloat = 10
    
    var verticalInset: CGFloat = 5
    
    @IBOutlet weak var collectionView: SelfSizingHorizontalCollectionView!
    
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setOneItem()
        
        collectionView.dataSource = self
        
        let horizontalCollectionViewFlowLayout = UICollectionViewFlowLayout()
        horizontalCollectionViewFlowLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = horizontalCollectionViewFlowLayout // Set Horizontal UICollectionViewFlowLayout
        
        let cellIdentifier = String(describing: CollectionViewCell.self)
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
        collectionView.contentInset = UIEdgeInsets(
            top: verticalInset,
            left: horizontalInset,
            bottom: verticalInset,
            right: horizontalInset
        )
        collectionView.horizontalScrollIndicatorInsets.left = 5
        collectionView.horizontalScrollIndicatorInsets.right = 5
    }
    
    @IBAction func setOneItem(_ sender: UIButton) {
        setOneItem()
        collectionView.reloadData()
    }
    
    @IBAction func setMultipleItems(_ sender: UIButton) {
        setMultipleItems()
        collectionView.reloadData()
    }
    
    private func setOneItem() {
        items = ["One"]
    }
    
    private func setMultipleItems() {
        items = [
            "One",
            "Two Two",
            "Three Three Three",
            "Four Four Four Four",
            "Five Five Five Five",
            "Six Six Six Six Six Six"
        ]
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = String(describing: CollectionViewCell.self)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = items[indexPath.row]
        cell.titleLabel.text = item
        return cell
    }
    
}
