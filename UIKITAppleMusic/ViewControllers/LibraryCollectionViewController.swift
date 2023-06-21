//
//  LibraryCollectionViewController.swift
//  UIKITAppleMusic
//
//  Created by Filipe Ilunga on 21/06/23.
//

import UIKit

class LibraryCollectionViewController: UIViewController {
 
    @IBOutlet weak var collectionView: UICollectionView!
    
    var musicCategorires: [MusicCollectionCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension LibraryCollectionViewController: UICollectionViewDelegate {
    
}

extension LibraryCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicCategorires.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionViewCellFactory.createCell(cellType: .category, for: collectionView, indexPath: indexPath) as! CategoryCollectionViewCell
        
        let category = musicCategorires[indexPath.row]
        
        cell.categoryImage.image = UIImage(named: category.description)
        cell.categoryName.text = category.description
        
        return cell
    }
    
   
}
