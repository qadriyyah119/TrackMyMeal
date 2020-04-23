//
//  UIButtonExtension.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 4/23/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

extension UIButton {

  func addMealButtonSettings () {
    
    backgroundColor = UIColor.white
    layer.borderWidth = 1
    layer.borderColor = Theme.accentColor?.cgColor
    layer.cornerRadius = frame.height / 2
    setTitleColor(UIColor.black, for: .normal)
    titleLabel?.font = UIFont(name: Theme.mainFontName, size: 16)
  }

}
