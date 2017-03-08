//
//  Person.swift
//  IOU App
//
//  Created by HChlebek on 2/22/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class Person : NSObject
{
    var name = ""
    var moneyOwed = 0.0
    var totalMoney = 0.0
    var date = NSDate()
    //var date = NSDateComponents()
    init(Name: String, MoneyOwed: Double, TotalMoney: Double, Date: NSDate)
    {
        super.init()
        
        name = Name
        moneyOwed = MoneyOwed
        totalMoney = TotalMoney
        date = Date
    }
}
