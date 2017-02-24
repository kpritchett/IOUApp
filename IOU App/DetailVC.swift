//
//  DetailVC.swift
//  IOU App
//
//  Created by HChlebek on 2/24/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITableViewDataSource, UITabBarDelegate
{
    var people : Person!
    var moneyArray : [Int] = []
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moneyTableView: UITableView!
    @IBOutlet weak var totalMoneyLabel: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nameLabel.text = people.name
        totalMoneyLabel.text = "Total Owed: $\()"
        moneyArray.append(people.moneyOwed)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = moneyTableView.dequeueReusableCell(withIdentifier: "moneyCell", for: indexPath)
        cell.textLabel!.text = String(moneyArray)[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return moneyArray.count
    }
}
