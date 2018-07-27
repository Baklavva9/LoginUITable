//
//  BudgetDetailViewController.swift
//  UITableLatest
//
//  Created by Xcode Server on 12/5/18.
//  Copyright © 2018 Xcode Server. All rights reserved.
//

import UIKit
import Firebase

class BudgetDetailViewController: UIViewController {
    
   // @IBOutlet var backtomainButtonItem: UIBarButtonItem!
    @IBOutlet var editbarButtonItem: UIBarButtonItem!
    
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    
    var budget: Budget!
    

    var month: String = ""
    var amountbudget: String = ""
    var key: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
   //     self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.rightBarButtonItem = editbarButtonItem
        
        monthLabel.text = month
        amountLabel.text = amountbudget
                
   }
    
    @IBAction func editBudget(_ sender: Any) {
        
        let vcBudgetEdit = storyboard?.instantiateViewController(withIdentifier: "BudgetEditViewController") as? BudgetEditViewController

            vcBudgetEdit?.month = month
            vcBudgetEdit?.amountbudget = amountbudget
            vcBudgetEdit?.key = key
    
        self.navigationController?.pushViewController(vcBudgetEdit!, animated: true)

    }
    
    @IBAction func backtomainBudgetView(_ sender: UIBarButtonItem) {
        
        let vcBudgetView = storyboard?.instantiateViewController(withIdentifier: "BudgetViewController") as? BudgetViewController

        self.navigationController?.pushViewController(vcBudgetView!, animated: true)
        
    }
    
    
    // work with UIStoryboard and sender.source to update budget on VC // 
//    func didunwinditself(_ sender: UIStoryboard) {
//
//        let sb = storyboard?.instantiateViewController(withIdentifier: "BudgetEditController") as? BudgetEditController
//
//        guard let sb = sender.source as? BudgetEditController sb else { return }
//
//
//    }
    
    //    class ModalVC: UIViewController {
    //        func someFunc() {
    //            dismiss(animated: true) {
    //                if let parent = self.presentingViewController {
    //                    parent.doSomething()
    //                }
    //            }
    //        }
    //    }
}

