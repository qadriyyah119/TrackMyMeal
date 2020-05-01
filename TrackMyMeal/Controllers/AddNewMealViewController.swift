//
//  AddNewMealViewController.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 4/6/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

// Any viewController that wants to get a new meal entry back must implement this protocol
protocol AddNewMealViewDelegate: class {
  func addNewMealViewController(_ controller: AddNewMealViewController, didFinishAdding meal: MealListItem)
  func addNewMealViewController(_ controller: AddNewMealViewController, didFinishEditing meal: MealListItem, oldMealSectionIndex: Int, newMealSectionIndex: Int)
}

class AddNewMealViewController: UIViewController {
  
  // any viewController that implements this protocol can be a delegate of the AddNewMealViewController
  weak var delegate: AddNewMealViewDelegate?
  
  // for editing activities
  weak var mealToEdit: MealListItem?
  weak var mealList: MealList?
  var mealSectionIndexToEdit: Int!
  var mealIndexToEdit: Int!
    
  private var mealCategory: MealCategory?
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var addButton: UIButton!
  @IBOutlet weak var mealNameTextField: UITextField!
  @IBOutlet weak var calorieTextField: UITextField!

  @IBOutlet var mealCategoryButtons: [UIButton]!
  
  override func viewDidLoad() {
      super.viewDidLoad()
      
    cancelButton.createFloatingActionButton()
    addButton.createFloatingActionButton()
    titleLabel.font = UIFont(name: Theme.titleFontName, size: 25)
    mealCategoryButtons.forEach({ $0.addMealButtonSettings()})
    
    if let meal = mealToEdit {
      titleLabel.text = "Edit Meal"
      mealNameTextField.text = meal.name
      calorieTextField.text = String(meal.calories)
      selectMealCategory(mealCategoryButtons[meal.category.rawValue])
      mealCategory = meal.category
    }
    
  }
  
  
  @IBAction func selectMealCategory(_ sender: UIButton) {
    mealCategoryButtons.forEach({ $0.backgroundColor = UIColor.white; $0.setTitleColor(UIColor.black, for: .normal)})
    
    sender.backgroundColor = Theme.tintColor
    sender.setTitleColor(UIColor.white, for: .normal)
  }
  
  @IBAction func didTapBreakfast(_ sender: UIButton) {
    mealCategory = .breakfast
    
  }
  @IBAction func didTapLunch(_ sender: UIButton) {
    mealCategory = .lunch
  }
  @IBAction func didTapDinner(_ sender: UIButton) {
    mealCategory = .dinner
    
  }
  @IBAction func didTapSnack(_ sender: UIButton) {
    mealCategory = .snack
  }
  
  
  @IBAction func cancel(_ sender: Any) {
    
    dismiss(animated: true)
  }
  
  @IBAction func save(_ sender: Any) {
    
    guard let mealCategory = self.mealCategory else { return }
    guard let calories = self.calorieTextField.text, let caloriesValue = Int(calories) else { return }
    guard let mealName = self.mealNameTextField.text else { return }
    
    if let mealListItem = mealToEdit {
      let oldMealSectionIndex = mealListItem.category.rawValue
      mealListItem.calories = caloriesValue
      mealListItem.name = mealName
      mealListItem.category = mealCategory
      let newMealSectionIndex = mealListItem.category.rawValue
      
      delegate?.addNewMealViewController(self, didFinishEditing: mealListItem, oldMealSectionIndex: oldMealSectionIndex, newMealSectionIndex: newMealSectionIndex)
      
    } else {
    
    let mealListItem = MealListItem(name: mealName, calories: caloriesValue, category: mealCategory)
    delegate?.addNewMealViewController(self, didFinishAdding: mealListItem)
    }
    dismiss(animated: true)
  }
  
  @IBAction func calorieTextFieldKeyboard(_ sender: Any) {
    calorieTextField.keyboardType = UIKeyboardType.numberPad
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
