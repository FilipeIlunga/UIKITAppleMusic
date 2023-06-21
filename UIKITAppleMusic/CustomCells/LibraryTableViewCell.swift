//
//  LibraryTableViewCell.swift
//  UIKITAppleMusic
//
//  Created by Raquel Ramos on 19/06/23.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var itenLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //precisa fazer isso?
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
