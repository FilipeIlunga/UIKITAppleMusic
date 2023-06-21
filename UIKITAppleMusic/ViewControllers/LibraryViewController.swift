//
//  LibraryViewController.swift
//  UIKITAppleMusic
//
//  Created by Raquel Ramos on 19/06/23.
//

import UIKit

class LibraryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var libraryCell: UITableView!
    
    var itens: [String] = ["Playlists", "Artists", "Songs"]
    var icons: [String] = ["music.note.list", "music.mic", "music.note"]
    let cellID: String = "LibraryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Library"
        navigationController?.navigationBar.prefersLargeTitles = true
        libraryCell.dataSource = self
        libraryCell.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let icon = icons[indexPath.row]
        let iten = itens[indexPath.row]
        
        let cell = libraryCell.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! LibraryTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.iconImage.image = UIImage(systemName: icon)
        cell.itenLabel.text = iten
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let playlistVC = ViewControllerFactory.viewController(for: .playlist)
            navigationController?.pushViewController(playlistVC, animated: true)
        } else if indexPath.row == 2 {
            let songsListVC = ViewControllerFactory.viewController(for: .songs)
            navigationController?.pushViewController(songsListVC, animated: true)
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
