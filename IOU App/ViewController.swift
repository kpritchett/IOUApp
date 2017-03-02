//
//  ViewController.swift
//  IOU App
//
//  Created by Student on 2/21/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITabBarDelegate
{

    @IBOutlet var myTableView: UITableView!
    var persons = [Person]()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let persona = persons[indexPath.row]
        cell.textLabel!.text = "\(persona.name)" + " owes $" + "\(persona.totalMoney)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return persons.count
    }
    
    @IBAction func addButtonTapped(_ sender: Any)
    {
        let myAlert = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        myAlert.addTextField{ (nameTextField) -> Void in
            nameTextField.placeholder = "Person Name"
        }
        myAlert.addTextField{ (moneyTextField) -> Void in
            moneyTextField.placeholder = "Money Owed"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        myAlert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .default) { (addAction) -> Void in
            let nameTF = myAlert.textFields![0]
            let moneyTF = myAlert.textFields![1]
            self.persons.append(Person(Name: nameTF.text!, MoneyOwed: Double(moneyTF.text!)!, TotalMoney: Double(moneyTF.text!)!))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        self.present(myAlert, animated: true, completion: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let IndexPath = myTableView.indexPathForSelectedRow
        {
            let people = persons[IndexPath.row]
            let nextController = segue.destination as! DetailVC
            nextController.people = people
        
        }
    }
    

}

