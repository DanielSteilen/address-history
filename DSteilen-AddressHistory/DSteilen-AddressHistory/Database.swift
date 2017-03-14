//
//  Database.swift
//  DSteilen-AddressHistory
//
//  Created by Daniel Steilen on 3/13/17.
//  Copyright © 2017 DSteilen. All rights reserved.
//

import Foundation
import SQLite

class Database {
    static let instance = Database()
    private let db: Connection?
    
    private let addresses = Table("Address")
    
    private let street1911 = Expression<String>("Street1911")
    private let number1911 = Expression<Int>("Number1911")
    private let street1910 = Expression<String>("Street1910")
    private let number1910 = Expression<Int>("Number1910")
   
    
    init() {
        let path = Bundle.main.path(forResource: "ChicagoAddress", ofType: "db") //should type be db?
        
        do {
            db = try Connection(path!, readonly: true)
        } catch {
            db = nil
            print("Unable to connect to database")
        }
    }
    
    func pastToPresent(_ addressNum: Int, _ direction: String, _ streetName: String) -> String  {
        var num: String = "Address"
        var street: String = "not found"
        //print(direction + " " + streetName)
        let query = addresses.select(street1911, number1911)
                            .filter(street1910 == (direction + " " + streetName) && number1910 == addressNum)
        

        
        do {
            if let firstRow = try db!.pluck(query) {
                print("First row = \(firstRow)")
                num = firstRow.get(Expression<String>("Number1911")) //have to use string expression here
                print("Unwrap is a success!")
                street = firstRow.get(street1911)
            }
        } catch {
            print("Pluck row failed.")
        }
      
        return num + " " + street
    }
    //.filter(street1910 == "E Adams St" && number1910 == 54)
    
    static func getSingleton() -> Database {
        return instance
    }
    
   
}

