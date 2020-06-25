//
//  UITableViewCustomSettings.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 4/22/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

extension UITableView {

  func addTableViewDesignSettings() {
    backgroundColor = Theme.backgroundColor
    layoutMargins = UIEdgeInsets.zero
    separatorInset = UIEdgeInsets.zero
    separatorColor = Theme.accentColor
    //tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
  }
}
