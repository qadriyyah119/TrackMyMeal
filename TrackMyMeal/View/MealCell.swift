//
//  MealTableViewCell.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 3/9/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class MealCell: UITableViewCell {
  
  @IBOutlet weak var mealTextLabel: UILabel!
  @IBOutlet weak var calorieLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
      self.backgroundColor = UIColor.clear
      mealTextLabel.font = UIFont(name: Theme.mainFontName, size: 16)
      calorieLabel.font = UIFont(name: Theme.mainFontName, size: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
