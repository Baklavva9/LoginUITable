//
//  BudgetTableViewCell.swift
//  UITableLatest
//
//  Created by Xcode Server on 11/5/18.
//  Copyright © 2018 Xcode Server. All rights reserved.
//

import UIKit
import Firebase

class BudgetTableViewCell: UITableViewCell {

    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    
    @IBOutlet var cellView: UIView!
  
    var budget: Budget! {
        didSet {
            monthLabel.text = budget.month
            amountLabel.text = budget.amountbudget
            yearLabel.text = budget.year
        }
    }
    
    
}
