//
//  Meal+CoreDataClass.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 5/28/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//
//

import Foundation
import CoreData


enum MealCategory: Int32, CaseIterable, Equatable {
  case breakfast = 0, lunch, dinner, snack
  
  var mealName: String {
      switch self {
      case .breakfast: return "Breakfast"
      case .lunch: return "Lunch"
      case .dinner: return "Dinner"
      case .snack: return "Snack"
      }
  }
}

public class Meal: NSManagedObject {
  
  
  }
  


