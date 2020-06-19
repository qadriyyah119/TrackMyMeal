//
//  Meal+CoreDataProperties.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 5/28/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//
//

import Foundation
import CoreData


extension Meal: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var name: String
    @NSManaged public var id: UUID
    @NSManaged public var calories: Int32
    @NSManaged public var category: Int32
  
    var mealCategory: MealCategory {
    get { MealCategory(rawValue: category) ?? .breakfast }
    set { category = newValue.rawValue }
  }

}


