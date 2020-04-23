//
//  UINavigationTitleSettings.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 4/22/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

extension UINavigationBar {

  func addNavigationTitleCustomSettings() {
    
    let navBarAppearance = UINavigationBar.appearance()
    navBarAppearance.titleTextAttributes = [
      NSAttributedString.Key.font: UIFont(name: Theme.titleFontName, size: 35)!,
      NSAttributedString.Key.foregroundColor: Theme.accentColor!
    ]
    
//    let attrs = [
//      NSAttributedString.Key.font: UIFont(name: Theme.titleFontName, size: 35)
//      NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single
//      ] as [NSAttributedString.Key : Any]
 //   ]
  }

}
