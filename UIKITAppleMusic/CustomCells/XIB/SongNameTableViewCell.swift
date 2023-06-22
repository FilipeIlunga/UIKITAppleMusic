//
//  File.swift
//  UIKITAppleMusic
//
//  Created by Raquel Ramos on 21/06/23.
//

import Foundation

import UIKit

protocol FavoriteButtonDelegate: AnyObject {
    func favoriteButtonDidTapped(music: Music)
}

class SongNameTableViewCell: UITableViewCell {

    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var songGroupName: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    weak var delegate: FavoriteButtonDelegate?
    var isFavorite: Bool = true
    
    var Musica: Music?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }

    
    func setCellInfo(music: Music, isFavorite: Bool) {
        progressBar.progressTintColor = .lightGray

        songName.text = music.title
        songGroupName.text = music.artist
        if isFavorite {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @IBAction func favoriteButtonDidTapped(_ sender: Any) {
        guard let music = Musica else {
            return
        }
        delegate?.favoriteButtonDidTapped(music: music)
    }

}
