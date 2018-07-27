//
//  BudgetEditViewController.swift
//  UITableLatest
//
//  Created by Xcode Server on 14/5/18.
//  Copyright © 2018 Xcode Server. All rights reserved.
//

import UIKit
import Firebase

class BudgetEditViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    
    @IBOutlet var amountField: UITextField!
    @IBOutlet var confirmButton: UIButton!
    
    var month: String = ""
    var year: String = ""
    var amountbudget: String = ""
    
    
    var key: String!
    
    var budgets = [Budget]()
    var budget: Budget!
    
    var ref = Database.database().reference()
    
    var BudgetEditViewController : UIViewController!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // how to make data appear on viewcontroller
        monthLabel.text = month
        amountField.text = "\(amountbudget)"
        
        
        
    }
    
    
    @IBAction func confirmBudget(_ sender: UIButton) {
        
        if  amountField.text != "" {
            
            // reference to Database
        
            let ref = Database.database().reference()
            let key = ref.child("budgets").childByAutoId().key
        
            
            //appending budget class to optional
            
            let postamount: [String : Any? ] = [  "key"                 : self.key,
                                                  "year"                : self.year,
                                                  "month"               : self.month,
                                                  "amountbudget"        : self.amountField.text! ]
            
            ref.child("budgets").childByAutoId().updateChildValues(postamount) {
           
            (error:Error?, ref:DatabaseReference) in
                      if let error = error {
                print("Data could not be saved: \(error).")
            } else {
                print("Data saved successfully!")
                 }
                }
           }
            
              self.navigationController?.popViewController(animated: true)
  }

 }



//    func updateData() -> [String: Any?] {
//
////        self.ref.child("budgets").childByAutoId().child("amountbudget").setValue(self.amountField.text)
////        return
//
//}


//        let childUpdates = ["/budgets/\(key)": budgetDictionary,
//                                                                  ]
//       ref.updateChildValues(childUpdates)

//let ref = Database.database().reference().child("budgets").childByAutoId()
//let key = ref.key
//
//let postamount  = [ "amountbudget" : amountField.text!]
//
//let post: [String : Any? ] = [  "key"          : key,
//                                "year"          : year,
//                                "month"         : month,
//                                "amountbudget"  : amountField! ]
//
//refUp.updateChildValues(post)



//self.ref.child("budgets").observeSingleEvent(of: .value) { (snapshot: DataSnapshot) in
//
//    if let value = snapshot.value as? [String: Any] {
//
//        self.month = value["month"] as! String
//        self.amountbudget = value["amountbudget"] as! String
//
//        if self.amountField.text != "" {
//            self.amountField.text = value["amountbudget"] as? String
//        }
//    }
//}









