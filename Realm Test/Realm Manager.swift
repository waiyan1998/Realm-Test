//
//  Realm Manager.swift
//  Realm Test
//
//  Created by Wai Yan on 5/4/20.
//  Copyright © 2020 Wai Yan. All rights reserved.
//

import Foundation
import RealmSwift

class Realm_Manager {
    var realm  : Realm!
    
    init(username :String) {
        
       
        var config = Realm.Configuration()
        
        // Use the default directory, but replace the filename with the username
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(username).realm")
        
        // Set this as the configuration used for the default Realm
        Realm.Configuration.defaultConfiguration = config
        print(config.description)
    
        
        // Open the Realm with the configuration
           realm = try! Realm()
        
        // Read some data from the bundled Realm
      
        
    }
    

    func write_data(Data : Object ) -> Void  {
        
        try! realm.write {
            
            realm.add(Data)
        }
        
    }
    
    func retrieveData () -> Results<Person> {
    
    let results = realm.objects(Person.self) // .filter("age < 2") you can use filter like that
    
    return results
    
    }
    
    
    func delete(Data : Object)-> Void
    
    {
        try! realm.write {
            
            realm.delete(Data)
        }
        
    }
    
}
