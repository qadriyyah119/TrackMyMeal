//
//  TrackMyMealTableViewController.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 3/9/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class TrackMyMealTableViewController: UITableViewController {
    
    var mealList: MealList
  
  private func sectionForMealIndex(_ index: Int) -> MealCategory? {
    return MealCategory(rawValue: index)
  }
    
  required init?(coder aDecoder: NSCoder) {
    
    mealList = MealList()
    super.init(coder: aDecoder)
  }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.backgroundColor = UIColor.darkGray
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.separatorColor = UIColor(red: 0.77, green: 0.27, blue: 0.41, alpha: 1.00)
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
      
      // Register my custom header view
      tableView.register(SectionHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mealList = MealList()
    }
    
    // MARK: - TableView DataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return MealCategory.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title: String? = nil
      
      if let sectionTitle = sectionForMealIndex(section){
        switch sectionTitle{
        case .breakfast:
          title = "Breakfast"
        case .lunch:
          title = "Lunch"
        case .dinner:
          title = "Dinner"
        case .snack:
          title = "Snack"
        }
      }
        return title
    }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader")
  }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
      if let sectionTitle = sectionForMealIndex(section){
        switch sectionTitle {
        case .breakfast:
          return mealList.mealSectionList(for: sectionTitle).count
        case .lunch:
          return mealList.mealSectionList(for: sectionTitle).count
        case .dinner:
          return mealList.mealSectionList(for: sectionTitle).count
        case .snack:
          return mealList.mealSectionList(for: sectionTitle).count
        }
      }
        // switch to check and get correct section
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealListCell", for: indexPath) as? MealCell else {
            fatalError("Fatal Error Test")
        }
        
      if let sectionTitle = sectionForMealIndex(indexPath.section) {
        let meals = mealList.mealSectionList(for: sectionTitle)
        let meal = meals[indexPath.row]
        
        cell.mealTextLabel.text = meal.name
        cell.calorieLabel.text = String(meal.calories)
      }
        
        cell.backgroundColor = UIColor.clear
        cell.mealTextLabel.textColor = UIColor.white
        cell.calorieLabel.textColor = UIColor.white
        
        return cell
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    //MARK: Actions
    
    @IBAction func addMeal(_ sender: Any) {
        print("Added Item")
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
