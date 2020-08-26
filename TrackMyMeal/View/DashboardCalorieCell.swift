//
//  DashboardCalorieCell.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 8/25/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class DashboardCalorieCell: UITableViewCell {
  
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var caloriesUsed: UILabel!
  @IBOutlet weak var caloriesRemaining: UILabel!
  @IBOutlet weak var progressBar: UIProgressView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
