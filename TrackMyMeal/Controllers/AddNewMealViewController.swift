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
  
  @IBAction func selectMealCategory(_ sender: UIButton) {
    
  }
  
    @IBAction func didTapBreakfast(_ sender: UIButton) {
        mealCategory = .breakfast
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
