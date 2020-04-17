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
}

class AddNewMealViewController: UIViewController {
  
  // any viewController that implements this protocol can be a delegate of the AddNewMealViewController
  weak var delegate: AddNewMealViewDelegate?
    
    private var mealCategory: MealCategory?
  
  @IBOutlet weak var cancelBarButton: UIBarButtonItem!
  @IBOutlet weak var addBarButton: UIBarButtonItem!
  @IBOutlet weak var mealNameTextField: UITextField!
  @IBOutlet weak var calorieTextField: UITextField!

  @IBOutlet var mealCategoryButtons: [UIButton]!
  
  @IBAction func selectMealCategory(_ sender: UIButton) {
    mealCategoryButtons.forEach({ $0.backgroundColor = UIColor.white })
    
    sender.backgroundColor = UIColor(red: 0.77, green: 0.27, blue: 0.41, alpha: 1.00)
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
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func save(_ sender: Any) {
    guard let mealCategory = self.mealCategory else { return }
    guard let calories = self.calorieTextField.text, let caloriesValue = Int(calories) else { return }
    guard let mealName = self.mealNameTextField.text else { return }
    
    let mealListItem = MealListItem(name: mealName, calories: caloriesValue, category: mealCategory)
    delegate?.addNewMealViewController(self, didFinishAdding: mealListItem)
  }
  
  @IBAction func calorieTextFieldKeyboard(_ sender: Any) {
    calorieTextField.keyboardType = UIKeyboardType.numberPad
  }
  
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    view.backgroundColor = UIColor.darkGray
    
    
    

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
