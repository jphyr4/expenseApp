//
//  Expense+CoreDataClass.swift
//  CategoricalExpenses
//
//  Created by Jacob Paul Hassler on 9/28/18.
//  Copyright © 2018 Shawn Moore. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {
    var date: Date?{
        get{
            return rawDate as Date?
        }
        set{
            rawDate = newValue as NSDate?
        }
    }
    convenience init?(name: String?, amount:Double, date:Date?){
      let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        self.init(entity: Expense.entity(), insertInto: context)
        self.name = name
        self.amount = amount
        self.date = date
    }
}
