//
//  MealList.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 3/9/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import Foundation

class MealList {
  
  var meals: [MealListItem] = []
  
  init() {
   
    let item1 = MealListItem(name: "Oatmeal", calories: 200)
    let item2 = MealListItem(name: "Popcorn", calories: 90)
    let item3 = MealListItem(name: "Salad", calories: 280)
    let item4 = MealListItem(name: "Salmon", calories: 350)
    let item5 = MealListItem(name: "Smoothie", calories: 310)
    let item6 = MealListItem(name: "Farro", calories: 190)
    let item7 = MealListItem(name: "Lemon Cake", calories: 510)
    
    meals.append(item1)
    meals.append(item2)
    meals.append(item3)
    meals.append(item4)
    meals.append(item5)
    meals.append(item6)
    meals.append(item7)
  }
  
}
