//
//  FavoritesViewController.swift
//  UIKITAppleMusic
//
//  Created by Filipe Ilunga on 19/06/23.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let favoriteMusics: [Music] = try! MusicService().getAllMusics()
    
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        title = "Favorites"
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Artists, Songs, Lyrics, and More"
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension FavoritesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension FavoritesViewController:  UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if favoriteMusics.count == 0 {
            return 292.0
        }
        return 74
    }
}

extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if favoriteMusics.isEmpty {
            return 1
        } else {
            return favoriteMusics.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell()
        
        if favoriteMusics.isEmpty {
            let emptyCell = TableViewCellFactory.createCell(cellType: .emptyFavorite, for: tableView, indexPath: indexPath) as! EmptyFavoriteTableViewCell
            
            emptyCell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            cell = emptyCell
            
        } else {
            let musicRowcell = TableViewCellFactory.createCell(cellType: .musicRow, for: tableView, indexPath: indexPath) as! MusicRowTableViewCell
            
            let music = favoriteMusics[indexPath.row]
            
            musicRowcell.tag = indexPath.row
            
            musicRowcell.setupCell(music: music, showFavorite: true)
            cell = musicRowcell
        }
        
        
        return cell
    }
    
}
