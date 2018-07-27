//
//  BudgetViewController.swift
//  UITableLatest
//
//  Created by Xcode Server on 11/5/18.
//  Copyright © 2018 Xcode Server. All rights reserved.
//

import UIKit
import Firebase


class BudgetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // for you declare the variable below, make sure you create a class, see class above
     @IBOutlet var backtomainButtonItem: UIBarButtonItem!
    
    var budgets = [Budget]()
    
    var month: String = ""
    var amountbudget: String = ""
    var key: String!
    
    
//    var month = ["january", "february", "march"]
//    var amount = ["$1000", "$1000"]
    
//    declare tableView, and declare tableView.delegate / datasource, include UIVIEW in cell file
    
    @IBOutlet var tableView: UITableView!
    
    var budget: Budget!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
       //making sure that your top nav appears
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    
    
        // next, insert custom back button here, and hide it here...

        
        
        // referencing database to firebase
        
        let ref = Database.database().reference().child("budgets")
        
        ref.observe(.value, with: { (snapshot) in
            
            self.budgets.removeAll()
//            print(snapshot)
        
            for child in snapshot.children {
                let budgetSnapshot = child as! DataSnapshot
                let budget = Budget(snapshot: budgetSnapshot)

                self.budgets.insert(budget, at: 0)
            }
            self.tableView.reloadData()
        })
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return budgets.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "budgetCell", for: indexPath) as! BudgetTableViewCell
        
        let budget = budgets[indexPath.row]

        cell.monthLabel.text = budget.month
        cell.amountLabel.text = budget.amountbudget
        cell.yearLabel.text = budget.year
       
        //how to test that UITableView cell works
        
//        cell.monthLabel.text = "hello"
//        cell.amountLabel.text = "lalalalla"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    if let viewC = storyboard?.instantiateViewController(withIdentifier: "BudgetDetailViewController") as? BudgetDetailViewController {

        let detailBudget = budgets[indexPath.row]
        viewC.month = detailBudget.month
        viewC.amountbudget = detailBudget.amountbudget
        viewC.key = detailBudget.key

        self.navigationController?.pushViewController(viewC, animated: true)

        }
    }
    
}
