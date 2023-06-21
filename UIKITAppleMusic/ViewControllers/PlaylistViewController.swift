//
//  PlaylistViewController.swift
//  UIKITAppleMusic
//
//  Created by Raquel Ramos on 20/06/23.
//

import UIKit

class PlaylistViewController: UIViewController, UITableViewDataSource {
   
    @IBOutlet weak var playlistTableView: UITableView!
    let album: String = "2I6IMEnTRj1fceLJL1bU4X"
    //ajeitar com a help da mari dps
    let playlistSongs: [Music] = try! MusicService().getAllMusics()
    let CellId: String = "nameCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playlistTableView.dataSource = self
        title = "Playlist"
        //navigationController?.navigationBar.prefersLargeTitles = false
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1{
            return 1
        }
        //quando pegar as musicas, colocar o .count
        else { return 10 }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0 {
           let customCell = TableViewCellFactory.createCell(cellType: .albumImage, for: tableView, indexPath: indexPath) as! AlbumImageTableViewCell
            customCell.albumImage.image = UIImage(named: album)
            cell = customCell
        
        } else if indexPath.section == 1 {
            let nameCell = playlistTableView.dequeueReusableCell(withIdentifier: CellId, for: indexPath)
            cell = nameCell
        }
        else {
            let musicRowcell = TableViewCellFactory.createCell(cellType: .musicRow, for: tableView, indexPath: indexPath) as! MusicRowTableViewCell
            
            let music = playlistSongs[indexPath.row]
            
            musicRowcell.tag = indexPath.row
            
            musicRowcell.setupCell(music: music, showFavorite: false)
            cell = musicRowcell
        }
        return cell
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
