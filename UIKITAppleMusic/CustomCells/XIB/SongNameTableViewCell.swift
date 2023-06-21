//
//  File.swift
//  UIKITAppleMusic
//
//  Created by Raquel Ramos on 21/06/23.
//

import Foundation

import UIKit

class SongNameTableViewCell: UITableViewCell {

    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var songGroupName: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var Musica: Music?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
