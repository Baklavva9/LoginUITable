//
//  BudgetClass.swift
//  UITableLatest
//
//  Created by Xcode Server on 11/5/18.
//  Copyright © 2018 Xcode Server. All rights reserved.
//

import Foundation
import Firebase

class Budget {

    var year: String = ""
    var month: String = ""
    var amountbudget: String = ""
    var key : String!

    let ref: DatabaseReference!

    init(text: String, key: String = "") {

        self.year = text
        self.month = text
        self.amountbudget = text
        self.key = key

        ref = Database.database().reference().child("budgets").childByAutoId()
    }

    init(snapshot: DataSnapshot) {

        ref = snapshot.ref

        if let value = snapshot.value as? [String: Any] {

            year = value["year"] as! String
            month = value["month"] as! String
            amountbudget = value["amountbudget"] as! String
            key = value["key"] as! String
        }
            self.key = snapshot.key

        }
   
  }


//struct Budget {
//
//    var year: String!
//    var month: String!
//    var amountbudget: String!
//    var key : String!
//    var ref: DatabaseReference!
//
//    init(year: String, month: String, amountbudget: String, key: String = "") {
//
//        self.year = year
//        self.month = month
//        self.amountbudget = amountbudget
//        self.key = key
//        self.ref = Database.database().reference()
//
//    }
//
//    init(snapshot: DataSnapshot)  {
//
//        ref = snapshot.ref
//
//                if let value = snapshot.value as? [String: Any] {
//
//                    year = value["year"] as! String
//                    month = value["month"] as! String
//                    amountbudget = value["amountbudget"] as! String
//                    key = value["key"] as! String
//
////                } else {
////
////                    self.key = snapshot.key
////
////                    return
//    }
// }
//}






