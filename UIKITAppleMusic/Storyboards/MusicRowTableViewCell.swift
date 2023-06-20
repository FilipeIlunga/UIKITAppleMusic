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
    
    func setCell(showFavorite: Bool = false) {
        if showFavorite {
            favortieButton.isHidden = false
        } else {
            favortieButton.isHidden = true
            accessoryType = .disclosureIndicator
        }
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
