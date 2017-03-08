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
    var moneyArray : [Double] = []
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moneyTableView: UITableView!
    @IBOutlet weak var totalMoneyLabel: UILabel!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let moneyString = String(people.moneyOwed)
        nameLabel.text = people.name
        
        moneyArray.append(Double(moneyString)!)
        
       
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = moneyTableView.dequeueReusableCell(withIdentifier: "moneyCell", for: indexPath)
        cell.textLabel!.text = "$\((moneyArray)[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return moneyArray.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            moneyArray.remove(at: indexPath.row)
            
            moneyTableView.reloadData()
        }
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIButton)
    {
        let myAlert = UIAlertController(title: "Do they owe you even more money??", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (addAction) -> Void in
            let myMoneyTextField = myAlert.textFields! [0] as UITextField
            self.moneyArray.append(Double(myMoneyTextField.text!)!)
            self.moneyTableView.reloadData()
            self.people.totalMoney = self.moneyArray.reduce(0, +)
            self.totalMoneyLabel.text = "Total Owed: $\(self.people.totalMoney)"
            
        }
        myAlert.addAction(addAction)
        myAlert.addTextField { (myMoneyTextField) -> Void in
            myMoneyTextField.placeholder = "Add amount owed"
        }
      self.present(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func editingButtonTapped(_ sender: UIButton)
    {
        moneyTableView.isEditing = !moneyTableView.isEditing
        
        self.people.totalMoney = self.moneyArray.reduce(0, +)
        self.totalMoneyLabel.text = "Total Owed: $\(self.people.totalMoney)"
    }
    @IBAction func saveButtonTapped(_ sender: UIButton)
    {
        people.totalMoney = people.totalMoney
    }
}
