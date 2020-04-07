//
//  AddNewMealViewController.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 4/6/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class AddNewMealViewController: UIViewController {
  
  @IBOutlet weak var mealNameTextField: UITextField!
  @IBOutlet weak var calorieTextField: UITextField!
  @IBOutlet var mealCategoryButtons: [UIButton]!
  
  @IBAction func selectMealCategory(_ sender: UIButton) {
    
  }
  
  
  
  @IBAction func cancel(_ sender: Any) {
  }
  
  @IBAction func save(_ sender: Any) {
  }
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    view.backgroundColor = UIColor.darkGray

    for button in mealCategoryButtons {
      button.layer.cornerRadius = 4
    }
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
