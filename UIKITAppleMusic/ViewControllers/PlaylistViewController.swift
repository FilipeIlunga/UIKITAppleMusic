//
//  PlaylistViewController.swift
//  UIKITAppleMusic
//
//  Created by Raquel Ramos on 20/06/23.
//

import UIKit

class PlaylistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var playlistTableView: UITableView!
    let album: String = "2I6IMEnTRj1fceLJL1bU4X"
    //ajeitar com a help da mari dps
    var playlistSongs: [Music] = []
    
    func setPlaylist() {
        playlistSongs  =  MusicService().getAllMusics().filter({ music in
            music.artist == albumAleatoria
        })
    }
    let CellId: String = "nameCell"
    
    let albumAleatoria: String = MusicService().getAllMusics()[0].artist
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playlistTableView.dataSource = self
        playlistTableView.delegate = self
        title = "Playlist"
        
        setPlaylist()
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1{
            return 1
        }
        //quando pegar as musicas, colocar o .count
        else { return playlistSongs.count }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0 {
           let customCell = TableViewCellFactory.createCell(cellType: .albumImage, for: tableView, indexPath: indexPath) as! AlbumImageTableViewCell
            customCell.albumImage.image = UIImage(named: playlistSongs[0].id)
            cell = customCell
        
        } else if indexPath.section == 1 {
            let nameCell = playlistTableView.dequeueReusableCell(withIdentifier: CellId, for: indexPath) as! PlaylistNameTableViewCell
            nameCell.name.text = playlistSongs[0].artist
            
            cell = nameCell
        }
        else {
            let musicRowcell = TableViewCellFactory.createCell(cellType: .musicRow, for: tableView, indexPath: indexPath) as! MusicRowTableViewCell
            
            let music = playlistSongs[indexPath.row]
            
            musicRowcell.tag = indexPath.row
            
            let isFavorite: Bool = MusicService.shared.isFavorite(music: music)
            
            musicRowcell.setCellInfo(music: music, isFavorite: isFavorite)
            
            cell = musicRowcell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2{
            let playingSongViewController = ViewControllerFactory.viewController(for: .individualSong) as! PlayingSongViewController
            let music = playlistSongs[indexPath.row]
            playingSongViewController.musica = music
            self.present(playingSongViewController, animated: true)
        }
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
