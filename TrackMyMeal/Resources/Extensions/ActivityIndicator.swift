//
//  ActivityIndicator.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 7/6/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

//var activityView: UIView?

extension UIViewController {
  
  func showActivitySpinner() {
    let aView = UIView(frame: self.view.bounds)
    aView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    activityIndicator.center = aView.center
    activityIndicator.startAnimating()
    aView.addSubview(activityIndicator)
    self.view.addSubview(activityIndicator)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      activityIndicator.stopAnimating()
      activityIndicator.isHidden = true
    }
  }
}
