//
//  UIViewShadowExtension.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 4/22/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

extension UIView {

  func addShadowandRoundedCorners() {
    // Drop shadow styling
    layer.shadowOpacity = 1
    layer.shadowOffset = CGSize.zero
    layer.shadowColor = UIColor.darkGray.cgColor
    layer.cornerRadius = 10
  }
}
