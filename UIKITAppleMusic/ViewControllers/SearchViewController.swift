//
//  SearchViewController.swift
//  UIKITAppleMusic
//
//  Created by Filipe Ilunga on 20/06/23.
//

import UIKit



class SearchViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let searchController: UISearchController = UISearchController()
    
    var musicCategorires: [MusicCollectionCategory] =  MusicCollectionCategory.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        
        searchController.searchResultsUpdater = self
        collectionView.dataSource = self
        collectionView.delegate = self
       // collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension SearchViewController: UICollectionViewDataSource {
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

//extension SearchViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 170, height: 170)
//    }
//}

extension SearchViewController: UICollectionViewDelegate {
    
}
