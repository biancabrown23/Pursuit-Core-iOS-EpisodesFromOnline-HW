//
//  ShowsTableViewCell.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Bianca Brown on 10/2/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ShowsTableViewCell: UITableViewCell {

    @IBOutlet weak var showImageOutlet: UIImageView!
    
    @IBOutlet weak var showNameLabel: UILabel!
    
    @IBOutlet weak var showRatingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
