//
//  FavoritesViewController.swift
//  UIKITAppleMusic
//
//  Created by Filipe Ilunga on 19/06/23.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var favoriteMusics: [Music] = MusicService.shared.favoriteMusics
    
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchController.searchResultsUpdater = self

        title = "Favorites"
        searchController.searchBar.placeholder = "Artists, Songs, Lyrics, and More"
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
    }
    
    func reloadData() {
        favoriteMusics = MusicService.shared.favoriteMusics
         tableView.reloadData()
    }
}

extension FavoritesViewController:  UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if favoriteMusics.count == 0 {
            return 292.0
        }
        return 74
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playingViewControler = ViewControllerFactory.viewController(for: .individualSong) as! PlayingSongViewController
        playingViewControler.musica = favoriteMusics[indexPath.row]
        playingViewControler.delegate = self
        self.present(playingViewControler, animated: true)
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
            musicRowcell.music = music
            musicRowcell.delegate = self
            
            let isFavorite: Bool = MusicService.shared.isFavorite(music: music)
            
            musicRowcell.setCellInfo(music: music, isFavorite: isFavorite, showFavoriteButton: true)
            cell = musicRowcell
        }
        return cell
    }
}

extension FavoritesViewController: FavoriteButtonDelegate {
    func favoriteButtonDidTapped(music: Music) {
        let isFavorite: Bool = MusicService.shared.isFavorite(music: music)
        MusicService.shared.toggleFavorite(music: music, isFavorite: isFavorite)
        favoriteMusics = MusicService.shared.favoriteMusics

        tableView.reloadData()
    }
}

extension FavoritesViewController: PlayingSongDelegate {
    func favoriteHasToggled() {
        reloadData()
    }
}

extension FavoritesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

