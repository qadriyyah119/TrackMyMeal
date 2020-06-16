//
//  TrackMyMealTableViewController.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 3/9/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit
import CoreData

class TrackMyMealTableViewController: UITableViewController, AddNewMealViewDelegate { //AddNewMealViewDelegate add when delegate is uncommented below
  
  private let appDelegate = UIApplication.shared.delegate as! AppDelegate
  private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
  var meals = [Meal]()
  
  private var fetchedResultsController: NSFetchedResultsController<Meal>?
    
  //var mealList: MealList
  
  private func sectionForMealIndex(_ index: Int) -> MealCategory? {
    return MealCategory(rawValue: Int32(index))
  }
    
  required init?(coder aDecoder: NSCoder) {
    
    //mealList = MealList()
    super.init(coder: aDecoder)
  }
    override func viewDidLoad() {
        super.viewDidLoad()
      
      tableView.addTableViewDesignSettings()
      
      // Register my custom header view
      tableView.register(SectionHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        //mealList = MealList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getMealLists()
        
    }
    
  private func getMealLists() {
    let request = Meal.fetchRequest() as NSFetchRequest<Meal>
    //let name = NSSortDescriptor(key: #keyPath(Meal.name), ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:)))
    let sort = NSSortDescriptor(key: #keyPath(Meal.category), ascending: true)
    request.sortDescriptors = [sort]
    fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: #keyPath(Meal.category), cacheName: nil)
    
    do {
      try fetchedResultsController?.performFetch()
      
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
  }
  
  
    // MARK: - TableView DataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
      return Int(MealCategory.allCases.count)
      
      //return fetchedResultsController?.sections?.count ?? 0
    }

  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as? SectionHeader else {
      return nil
    }
    
    var title: String = ""
    var calorieTotal: Int = 0
    
//    if let sectionCategory = sectionForMealIndex(section){
//      title = sectionCategory.mealName
//
//      calorieTotal = 0 //mealList.mealCalorieList(for: sectionCategory)
//    }
//
//    view.title.text = title
//    view.calorieCount.text = String(calorieTotal)

    
    if let mealSectionCategory = MealCategory(rawValue: Int32(section))?.mealName {
      view.title.text = mealSectionCategory
      view.calorieCount.text = String(calorieTotal)
    }
    
    return view
    
  }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
//      if let sectionTitle = sectionForMealIndex(section){
//        switch sectionTitle {
//        case .breakfast:
//          return mealList.mealSectionList(for: sectionTitle).count
//        case .lunch:
//          return mealList.mealSectionList(for: sectionTitle).count
//        case .dinner:
//          return mealList.mealSectionList(for: sectionTitle).count
//        case .snack:
//          return mealList.mealSectionList(for: sectionTitle).count
//        }
//      }
//        // switch to check and get correct section
//        return 0
      
      //first get the sections array from the fetched results controller. Next get a list of meals for that section
      guard let mealSections = fetchedResultsController?.sections,
        !mealSections.isEmpty,
        let mealSection = mealSections[section] else { return 0 }
      guard let meals = mealSection[section].objects as? [Meal] else { return 0 }
      
      //meals.filter { $0.category == Int32(mealSection) }
      
      //print(meals.count)
      return meals.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealListCell", for: indexPath) as? MealCell else {
            fatalError("Fatal Error Test")
        }
        
//      if let sectionCategory = sectionForMealIndex(indexPath.section) {
//        let meals = mealList.mealSectionList(for: sectionCategory)
//        let meal = meals[indexPath.row]
//
//
//        cell.mealTextLabel.text = meal.name
//        cell.calorieLabel.text = String(meal.calories)
//      }
      
        guard let meal = fetchedResultsController?.object(at: indexPath) else { return UITableViewCell() }
        cell.mealTextLabel.text = meal.name
        cell.calorieLabel.text = String(meal.calories)
        
        return cell
    }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }

  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }


//  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//    if editingStyle == .delete {
//      if let sectionCategory = sectionForMealIndex(indexPath.section) {
//      let meal = mealList.mealSectionList(for: sectionCategory)[indexPath.row]
//      print(meal.name)
//        if let index = mealList.meals.firstIndex(where: { $0.id == meal.id }) {
//          mealList.meals.remove(at: index)
//          tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//        tableView.reloadSections(IndexSet(integer: IndexSet.Element(sectionCategory.rawValue)), with: .automatic)
//      }
//    }
//  }

    
    //MARK: Actions
    
    @IBAction func addMeal(_ sender: Any) {
        print("Added Item")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewMealEntrySegue" {
            let destination = segue.destination as? AddNewMealViewController
            destination?.delegate = self
        } else if segue.identifier == "EditMeal" {
          let destination = segue.destination as? AddNewMealViewController
          if let cell = sender as? MealCell,
            let indexPath = tableView.indexPath(for: cell){
            let meal = fetchedResultsController?.object(at: indexPath)
//            let sectionCategory = sectionForMealIndex(indexPath.section) {
//            let meal = mealList.mealSectionList(for: sectionCategory)[indexPath.row]

            destination?.delegate = self
            destination?.mealToEdit = meal
          }
      }
    }

    func addNewMealViewController(_ controller: AddNewMealViewController, didFinishAdding meal: Meal) {

        if let sectionCategory = sectionForMealIndex(Int(meal.category)) {
        appDelegate.saveContext()
        getMealLists()
        tableView.reloadData()
        //meals.append(meal)
//        tableView.beginUpdates()
//          tableView.reloadSections(IndexSet(integer: IndexSet.Element(sectionCategory.rawValue)), with: .automatic)
//        tableView.endUpdates()
      }
        navigationController?.popViewController(animated: true)
    }

  func addNewMealViewController(_ controller: AddNewMealViewController, didFinishEditing meal: Meal, oldMealListItem: Meal ,oldMealSectionIndex: Int, newMealSectionIndex: Int) {

//    guard let sections = fetchedResultsController?.sections
//    
//    for sectionCategory in MealCategory.allCases { // all Meal Categories
//      let currentMeals = mealList.mealSectionList(for: sectionCategory) // array of meals in each meal category
//      if let index = currentMeals.firstIndex(where: { $0.id == meal.id }) { // the index of the array of meals that has the same UUID as the meal being passed in from 
//        let indexPath = IndexPath(row: index, section: newMealSectionIndex)
//
//        if oldMealSectionIndex == newMealSectionIndex {
//          tableView.beginUpdates()
//          tableView.reloadSections(IndexSet(integer: newMealSectionIndex), with: .automatic)
//          tableView.endUpdates()
//        } else {
//          if let sectionCategory = sectionForMealIndex(oldMealSectionIndex) {
//            let currentMeals = mealList.mealSectionList(for: sectionCategory)
//            if let index = currentMeals.firstIndex(where: { $0.id == oldMealListItem.id }) {
//              let oldIndexPath = IndexPath(row: index, section: oldMealSectionIndex)
//              mealList.meals.remove(at: index)
//              mealList.meals.append(meal)
//
//              tableView.deleteRows(at: [oldIndexPath], with: .automatic)
//            }
//            tableView.beginUpdates()
//            tableView.reloadSections(IndexSet(arrayLiteral: oldMealSectionIndex, newMealSectionIndex), with: .automatic)
//            tableView.endUpdates()
//          }
//        }
//      }
//    }
  }
}

// Look into the below message. Warning after didFinishAdding function and new row was inserted.
// 2020-04-14 18:55:08.648308-0400 TrackMyMeal[97036:13623309] [TableView] Warning once only: UITableView was told to layout its visible cells and other contents without being in the view hierarchy (the table view or one of its superviews has not been added to a window). This may cause bugs by forcing views inside the table view to load and perform layout without accurate information (e.g. table view bounds, trait collection, layout margins, safe area insets, etc), and will also cause unnecessary performance overhead due to extra layout passes. Make a symbolic breakpoint at UITableViewAlertForLayoutOutsideViewHierarchy to catch this in the debugger and see what caused this to occur, so you can avoid this action altogether if possible, or defer it until the table view has been added to a window. Table view: <UITableView: 0x7fcc91820c00; frame = (0 0; 414 896); clipsToBounds = YES; autoresize = W+H; gestureRecognizers = <NSArray: 0x60000125d590>; layer = <CALayer: 0x600001c56980>; contentOffset: {0, -88}; contentSize: {414, 579.33333333333337}; adjustedContentInset: {88, 0, 34, 0}; dataSource: <TrackMyMeal.TrackMyMealTableViewController: 0x7fcc90407fa0>>

