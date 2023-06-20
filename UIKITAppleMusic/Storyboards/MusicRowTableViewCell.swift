//
//  MusicRowTableViewCell.swift
//  UIKITAppleMusic
//
//  Created by Filipe Ilunga on 19/06/23.
//

import UIKit

class MusicRowTableViewCell: UITableViewCell {


    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    var isFavorite: Bool = false

    @IBOutlet weak var favortieButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImage.layer.cornerRadius = 4
        
    }
    
    func setupCell(music: Music,showFavorite: Bool = false) {
        setCellInfo(music: music)
        if showFavorite {
            favortieButton.isHidden = false
        } else {
            favortieButton.isHidden = true
            accessoryType = .disclosureIndicator
        }
    }
    
    func setCellInfo(music: Music) {
        posterImage.image = UIImage(named: music.id)
        titleLabel.text = music.title
        artistLabel.text = music.artist
    }
    
    
    @IBAction func favoriteButtonDidTapped(_ sender: Any) {
        if isFavorite {
            favortieButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            isFavorite = true
        } else {
            favortieButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            isFavorite = false
        }
    }
    
}
