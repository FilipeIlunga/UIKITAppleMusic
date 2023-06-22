//
//  TableViewCell.swift
//  UIKITAppleMusic
//
//  Created by Raquel Ramos on 21/06/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var songGroupName: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var name: UILabel!
    
    var Musica: Music?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
