//
//  MealList.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 3/9/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import Foundation


enum MealCategory: Int, CaseIterable {
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

class MealList {
  
  var meals: [MealListItem] = []

  init() {
   
    let item1 = MealListItem(name: "Oatmeal", calories: 200, category: .breakfast)
    let item2 = MealListItem(name: "Popcorn", calories: 90, category: .snack)
    let item3 = MealListItem(name: "Salad", calories: 280, category: .lunch)
    let item4 = MealListItem(name: "Salmon", calories: 350, category: .dinner)
    let item5 = MealListItem(name: "Smoothie", calories: 310, category: .breakfast)
    let item6 = MealListItem(name: "Farro", calories: 190, category: .lunch)
    let item7 = MealListItem(name: "Lemon Cake", calories: 510, category: .snack)
    let item8 = MealListItem(name: "Snapper", calories: 400, category: .dinner)
    let item9 = MealListItem(name: "Pancakes", calories: 200, category: .breakfast)
    let item10 = MealListItem(name: "Sweet Green", calories: 315, category: .lunch)
    
    meals.append(item1)
    meals.append(item2)
    meals.append(item3)
    meals.append(item4)
    meals.append(item5)
    meals.append(item6)
    meals.append(item7)
    meals.append(item8)
    meals.append(item9)
    meals.append(item10)
    
  }
  
  
  func mealSectionList(for mealCategory: MealCategory) -> [MealListItem] {
        return meals.filter { $0.category == mealCategory }
  }
  
  func mealCalorieList(for mealCategory: MealCategory) -> Int {
    let meals = mealSectionList(for: mealCategory)
    return meals.reduce(0) {$0 + ($1.calories)}
  }  
}
