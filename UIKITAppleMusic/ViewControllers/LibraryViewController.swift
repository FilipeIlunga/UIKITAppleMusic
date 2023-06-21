//
//  LibraryViewController.swift
//  UIKITAppleMusic
//
//  Created by Raquel Ramos on 19/06/23.
//

import UIKit

class LibraryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var libraryCell: UITableView!
    
    let cellID: String = "LibraryCell"
    
    var collection: [MusicCollectionType] = MusicCollectionType.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Library"
        navigationController?.navigationBar.prefersLargeTitles = true
        libraryCell.dataSource = self
        libraryCell.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let icon = collection[indexPath.row].icon
        let iten = collection[indexPath.row].description
        
        let cell = libraryCell.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! LibraryTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.iconImage.image = UIImage(systemName: icon)
        cell.itenLabel.text = iten
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // album|artists
        if [1,3].contains(indexPath.row) {
            let vc = ViewControllerFactory.viewController(for: .libraryCollection) as! LibraryCollectionViewController
            
            vc.title = collection[indexPath.row].description
            
            vc.navigationController?.navigationBar.prefersLargeTitles = false
            
            vc.musicCategorires = MusicCollectionCategory.allCases
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
