//
//  TrackMyMealViewController.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 7/27/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit
import CoreData

class TrackMyMealViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var addMealButton: UIButton!
  
  private let appDelegate = UIApplication.shared.delegate as! AppDelegate
  private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
  var meals = [Meal]()
  
  private var fetchedResultsController: NSFetchedResultsController<Meal>?
  
  private func sectionForMealIndex(_ index: Int) -> MealCategory? {
    return MealCategory(rawValue: Int32(index))
  }
    
  required init?(coder aDecoder: NSCoder) {
    
    super.init(coder: aDecoder)
  }
  

    override func viewDidLoad() {
        super.viewDidLoad()

      tableView.dataSource = self
      tableView.delegate = self
      
      // Register my custom header view
      tableView.register(SectionHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
      
      addMealButton.createFloatingActionButton()
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
    fetchedResultsController?.delegate = self
    
    do {
      try fetchedResultsController?.performFetch()
      
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
  }
  
  @IBAction func addNewMeal(_ sender: Any) {
    print("meal button pressed")
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "NewMealEntrySegue" {
          let destination = segue.destination as? AddNewMealViewController
          destination?.delegate = self
      } else if segue.identifier == "EditMeal" {
        let destination = segue.destination as? AddNewMealViewController
        if let cell = sender as? MealCell,
          let indexPath = self.tableView.indexPath(for: cell){
          let meal = fetchedResultsController?.object(at: indexPath)
          destination?.delegate = self
          destination?.mealToEdit = meal
        }
    }
  }

  
  
}

extension TrackMyMealViewController: UITableViewDataSource, UITableViewDelegate, AddNewMealViewDelegate {
  
  func numberOfSections(in tableView: UITableView) -> Int {
        
      return Int(MealCategory.allCases.count)
  
    }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    let allMealsForSection = fetchedResultsController?
      .fetchedObjects?
      .filter { $0.category == section }
    
    return allMealsForSection?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealListCell", for: indexPath) as? MealCell else {
            fatalError("Fatal Error Test")
        }
      
      configureCell(cell, at: indexPath)
        
        return cell
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as? SectionHeader else {
      return nil
    }
    
    let allMealsForSection = fetchedResultsController?
    .fetchedObjects?
    .filter { $0.category == section }
    
    let caloriesTotal = allMealsForSection?.reduce(0) {$0 + ($1.calories)} ?? 0
    
    view.title.text = MealCategory(rawValue: Int32(section))?.mealName ?? ""
    view.calorieCount.text = String(caloriesTotal)
    
    return view
    
  }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }

  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }


  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      
      let allMealsForSection = fetchedResultsController?
      .fetchedObjects?
        .filter { $0.category == indexPath.section }
      
      guard let meal = allMealsForSection?[indexPath.row] else { return }
      
      context.delete(meal)
      appDelegate.saveContext()
      getMealLists()
      self.showActivitySpinner()
      tableView.reloadData()
      //tableView.reloadSections(IndexSet(integer: IndexSet.Element(meal.category)), with: .automatic)
    }
  }
  
  func configureCell(_ cell: MealCell, at indexPath: IndexPath) {
    let allMealsForSection = fetchedResultsController?
    .fetchedObjects?
      .filter { $0.category == indexPath.section }
    
    guard let meal = allMealsForSection?[indexPath.row] else { return }
      cell.mealTextLabel.text = meal.name
      cell.calorieLabel.text = String(meal.calories)
  }
  
      func addNewMealViewController(_ controller: AddNewMealViewController, didFinishAdding meal: Meal) {

          appDelegate.saveContext()
          getMealLists()
        self.tableView.reloadData()

          navigationController?.popViewController(animated: true)
      }

    func addNewMealViewController(_ controller: AddNewMealViewController, didFinishEditing meal: Meal, oldMealListItem: Meal ,oldMealSectionIndex: Int, newMealSectionIndex: Int) {

      if oldMealSectionIndex == newMealSectionIndex {
        appDelegate.saveContext()
        getMealLists()
        tableView.reloadSections(IndexSet(integer: newMealSectionIndex), with: .fade)
      } else {
        appDelegate.saveContext()
        getMealLists()
        tableView.reloadSections(IndexSet(arrayLiteral: oldMealSectionIndex, newMealSectionIndex), with: .fade)
      }
    }
  }

extension TrackMyMealViewController: NSFetchedResultsControllerDelegate {
  
  func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    tableView.beginUpdates()
  }
  
  func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    
    switch type {
    case .insert:
      if let indexPath = newIndexPath {
        tableView.insertRows(at: [indexPath], with: .fade)
      }
    case .delete:
      if let indexPath = indexPath {
      tableView.deleteRows(at: [indexPath], with: .fade)
      }
    case .update:
      if let indexPath = indexPath, let cell = tableView.cellForRow(at: indexPath) {
        configureCell(cell as! MealCell, at: indexPath)
      }
    case .move:
      if let indexPath = indexPath {
        tableView.deleteRows(at: [indexPath], with: .fade)
      }
      if let newIndexPath = newIndexPath {
        tableView.insertRows(at: [newIndexPath], with: .fade)
      }
    default:
      break
    }
  }
  
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    tableView.endUpdates()
  }
}
