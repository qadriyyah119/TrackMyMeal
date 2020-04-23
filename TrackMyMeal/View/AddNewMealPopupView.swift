//
//  AddNewMealPopupView.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 4/23/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class AddNewMealPopupView: UIView {

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      
      layer.shadowOpacity = 1
      layer.shadowOffset = CGSize.zero
      layer.shadowColor = UIColor.darkGray.cgColor
      layer.cornerRadius = 10
      backgroundColor = Theme.backgroundColor
    }

}
