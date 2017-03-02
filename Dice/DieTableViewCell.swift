//
//  DieTableViewCell.swift
//  Dice
//
//  Created by Sina on 2/28/17.
//  Copyright © 2017 Sina. All rights reserved.
//

import UIKit

class DieTableViewCell: UITableViewCell {
    
    //MARK: Properties

    @IBOutlet weak var dieLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
