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
    
    var music: Music?
    
    @IBOutlet weak var favortieButton: UIButton!
    weak var delegate: FavoriteButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImage.layer.cornerRadius = 4
    }
    
    func setCellInfo(music: Music, isFavorite: Bool, showFavoriteButton: Bool = false) {
        
        posterImage.image = UIImage(named: music.id)
        titleLabel.text = music.title
        artistLabel.text = music.artist
        
        if isFavorite {
            favortieButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favortieButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
        if showFavoriteButton {
            favortieButton.isHidden = false
        } else {
            favortieButton.isHidden = true
            accessoryType = .disclosureIndicator
        }
    }
        
    @IBAction func favoriteButtonDidTapped(_ sender: Any) {
        guard let music = music else {
            return
        }
        delegate?.favoriteButtonDidTapped(music: music)
    }
    
}
