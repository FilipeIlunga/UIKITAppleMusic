//
//  FavoritesViewController.swift
//  UIKITAppleMusic
//
//  Created by Filipe Ilunga on 19/06/23.
//

import UIKit

class FavoritesViewController: UIViewController {
       
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        title = "Favorites"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension FavoritesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension FavoritesViewController:  UITableViewDelegate {
    
}

extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TableViewCellFactory.createCell(cellType: .musicRow, for: tableView, indexPath: indexPath) as! MusicRowTableViewCell
                
        cell.setCell(showFavorite: true)
        
        cell.titleLabel.text = "Melhor eu ir/Ligando os Fatos/Sonho de Amor/Deixa eu te querer"
      //  cell.posterImage.image = UIImage(systemName: "star")
        cell.artistLabel.text = "ola"
        return cell
    }
    
}
