//
//  PlayingSongViewController.swift
//  UIKITAppleMusic
//
//  Created by Raquel Ramos on 20/06/23.
//

import UIKit

class PlayingSongViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var playingSong: UITableView!
    //mudar depois pq ele vai receber de outro lugar isso
    var musica: Music?
    let CellID: String = "SongName"
    override func viewDidLoad() {
        super.viewDidLoad()
        playingSong.dataSource = self
        playingSong.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 250
        } else  {
            return 290
        }
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0 {
          
            let album = musica!.id //??????????
           let customCell = TableViewCellFactory.createCell(cellType: .albumImage, for: tableView, indexPath: indexPath) as! AlbumImageTableViewCell
            customCell.albumImage.layer.cornerRadius = 12
            customCell.albumImage.image = UIImage(named: album)
            
            cell = customCell
        } else if indexPath.section == 1 {
            let customCell = playingSong.dequeueReusableCell(withIdentifier: CellID, for: indexPath) as! TableViewCell
            customCell.songName.text = musica?.title
            customCell.songGroupName.text = musica?.artist
            customCell.progressBar.progressTintColor = .lightGray
            
            let timeInMin = musica!.length / 60.00
            let duracao = Double(round(timeInMin * 100)/100)
            customCell.name.text = String(duracao)
            cell = customCell
        }
        return cell
    }
    
}
