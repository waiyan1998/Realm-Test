//
//  ViewController.swift
//  Realm Test
//
//  Created by Wai Yan on 5/4/20.
//  Copyright © 2020 Wai Yan. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var Name_TF: UITextField!
    @IBOutlet weak var Age_TF: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var results : Results<Person>?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm_manager.retrieveData().count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = realm_manager.retrieveData()[indexPath.row].name
        cell.detailTextLabel?.text = String(realm_manager.retrieveData()[indexPath.row].age)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            print("delete")
            results = realm_manager.retrieveData()
            realm_manager.delete(Data : results![indexPath.row])
            self.tableView.reloadData()
            
        }
    }
    
   var  realm_manager = Realm_Manager(username: "waiyan")
    
    override func viewDidLoad() {
        
   super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    
    
    
    
    
    
    @IBAction func Add(_ sender: UIButton) {
        
        if (  Age_TF.text != nil && Name_TF.text != nil ){
            
        let p = Person()
            p.age = Int(Age_TF.text!)!
            p.name = Name_TF.text!
        
        
        realm_manager.write_data(Data: p)
        
        }
        
        self.tableView.reloadData()
    
    }
    
    
    
    
    

}
