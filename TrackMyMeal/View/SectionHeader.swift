//
//  SectionHeader.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 4/2/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class SectionHeader: UITableViewHeaderFooterView {

  let title = UILabel()
  let calorieCount = UILabel()
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    self.backgroundView?.backgroundColor = Theme.headerColor
    self.addShadowandRoundedCorners()
    title.font = UIFont(name: Theme.mainFontName, size: 17)
    calorieCount.font = UIFont(name: Theme.mainFontName, size: 17)
    configureContents()
  }
  
  func configureContents() {
    title.translatesAutoresizingMaskIntoConstraints = false
    calorieCount.translatesAutoresizingMaskIntoConstraints = false
    
    //adding the title and calorieCount labels as subviews to the Header cell
    contentView.addSubview(title)
    contentView.addSubview(calorieCount)
    
    NSLayoutConstraint.activate([
      
      title.heightAnchor.constraint(equalToConstant: 30), // set title height to 30 points
      title.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor), // place title near leading(left) side of the view.
      title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor), // center title vertically
      
      
      calorieCount.heightAnchor.constraint(equalToConstant: 30),
      calorieCount.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor), // place calorieCount label near trailing(right) side of view
      calorieCount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  

}
