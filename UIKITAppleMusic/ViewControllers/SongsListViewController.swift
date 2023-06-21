//
//  SongsListViewController.swift
//  UIKITAppleMusic
//
//  Created by Raquel Ramos on 20/06/23.
//

import UIKit

class SongsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var songList: UITableView!
    
    let songs: [Music] = try! MusicService().getAllMusics()
    override func viewDidLoad() {
        super.viewDidLoad()
        songList.dataSource = self
        songList.delegate = self
        title = "Songs"

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let musicRowcell = TableViewCellFactory.createCell(cellType: .musicRow, for: tableView, indexPath: indexPath) as! MusicRowTableViewCell
        
        let song = songs[indexPath.row]
        
        musicRowcell.tag = indexPath.row
        
        musicRowcell.setupCell(music: song, showFavorite: false)
        
        return musicRowcell
    }
    //fazer a parte de navegação para a parte de tocar musica
    
    
}
