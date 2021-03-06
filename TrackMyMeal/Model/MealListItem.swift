//
//  MealListItem.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 3/9/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit
// Data Model representing the structure and store the information on the Meal Detail scene/view

class MealListItem: Identifiable {
  
  let id: UUID
  var name: String
  var calories: Int
  var category: MealCategory
  
  // MARK: - Initialization
  
  init(name: String, calories: Int, category: MealCategory) {
    id = UUID()
    self.name = name
    self.calories = calories
    self.category = category
  }
}
