//
//  LibraryViewController.swift
//  UIKITAppleMusic
//
//  Created by Raquel Ramos on 19/06/23.
//

import UIKit

class LibraryViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var libraryCell: UITableView!
    
    var itens: [String] = ["Playlists", "Artists", "Songs"]
    var icons: [String] = ["music.note.list", "music.mic", "music.note"]
    let cellID: String = "LibraryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Library"
        navigationController?.navigationBar.prefersLargeTitles = true
        libraryCell.dataSource = self
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
