//
//  WaterTrackerTableViewCell.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 7/28/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class WaterTrackerCell: UITableViewCell {
  
  @IBOutlet var waterButtons: [UIButton]!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
