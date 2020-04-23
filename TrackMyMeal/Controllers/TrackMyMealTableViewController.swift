//
//  TrackMyMealTableViewController.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 3/9/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class TrackMyMealTableViewController: UITableViewController, AddNewMealViewDelegate {
    
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
      
      tableView.addTableViewDesignSettings()
      
      // Register my custom header view
      tableView.register(SectionHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        mealList = MealList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    // MARK: - TableView DataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return MealCategory.allCases.count
    }

  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as? SectionHeader else {
      return nil
    }
    
    var title: String = ""
    var calorieTotal: Int = 0
    
    if let sectionCategory = sectionForMealIndex(section){
        title = sectionCategory.mealName
      
      calorieTotal = mealList.mealCalorieList(for: sectionCategory)
    }
    
    view.title.text = title
    view.calorieCount.text = String(calorieTotal)
    
    return view
    
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
        
      if let sectionCategory = sectionForMealIndex(indexPath.section) {
        let meals = mealList.mealSectionList(for: sectionCategory)
        let meal = meals[indexPath.row]

        
        cell.mealTextLabel.text = meal.name
        cell.calorieLabel.text = String(meal.calories)
      }
        
        return cell
    }
  

    
    //MARK: Actions
    
    @IBAction func addMeal(_ sender: Any) {
        print("Added Item")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewMealEntrySegue" {
            let destination = segue.destination as? AddNewMealViewController
            destination?.delegate = self
        }
    }
    
    func addNewMealViewController(_ controller: AddNewMealViewController, didFinishAdding meal: MealListItem) {
      
      if let sectionCategory = sectionForMealIndex(meal.category.rawValue) {
        //let newIndexPath = IndexPath(row: mealList.mealSectionList(for: sectionCategory).count, section: sectionCategory.rawValue)
        mealList.meals.append(meal)
        tableView.beginUpdates()
        tableView.reloadSections(IndexSet(integer: sectionCategory.rawValue), with: .automatic)
        tableView.endUpdates()
      }
        navigationController?.popViewController(animated: true)
    }
}

// Look into the below message. Warning after didFinishAdding function and new row was inserted.
// 2020-04-14 18:55:08.648308-0400 TrackMyMeal[97036:13623309] [TableView] Warning once only: UITableView was told to layout its visible cells and other contents without being in the view hierarchy (the table view or one of its superviews has not been added to a window). This may cause bugs by forcing views inside the table view to load and perform layout without accurate information (e.g. table view bounds, trait collection, layout margins, safe area insets, etc), and will also cause unnecessary performance overhead due to extra layout passes. Make a symbolic breakpoint at UITableViewAlertForLayoutOutsideViewHierarchy to catch this in the debugger and see what caused this to occur, so you can avoid this action altogether if possible, or defer it until the table view has been added to a window. Table view: <UITableView: 0x7fcc91820c00; frame = (0 0; 414 896); clipsToBounds = YES; autoresize = W+H; gestureRecognizers = <NSArray: 0x60000125d590>; layer = <CALayer: 0x600001c56980>; contentOffset: {0, -88}; contentSize: {414, 579.33333333333337}; adjustedContentInset: {88, 0, 34, 0}; dataSource: <TrackMyMeal.TrackMyMealTableViewController: 0x7fcc90407fa0>>

