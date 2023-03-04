//
//  UserTableViewCell.swift
//  TaskUIdesigning
//
//  Created by Mac on 29/11/1944 Saka.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var userImages: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        firstNameLabel.layer.cornerRadius = 30
        userImages.layer.cornerRadius = 30
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
