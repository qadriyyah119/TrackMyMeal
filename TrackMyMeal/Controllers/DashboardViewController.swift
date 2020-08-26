//
//  DashboardViewController.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 8/25/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  

    override func viewDidLoad() {
        super.viewDidLoad()

      tableView.dataSource = self
    }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DashboardCalorieCell
    
    return cell
  }
    

}
