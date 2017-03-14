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
    
    func pastToPresent(_ addressNum: Int, _ direction: String, _ streetName: String, _ suffix: String) -> String  {
        var num: String = "Address"
        var street: String = "not found"
        let query = addresses.select(street1911, number1911)
                            .filter(street1910 == (direction + " " + streetName + " " + suffix) && number1910 == addressNum)
        
        do {
            if let firstRow = try db!.pluck(query) {
                num = firstRow.get(Expression<String>("Number1911")) //have to use string expression here
                street = firstRow.get(street1911)
            }
        } catch {
            print("Pluck row failed.")
        }
      
        return num + " " + street
    }
    
    func presentToPast(_ addressNum: Int, _ direction: String, _ streetName: String, _ suffix: String) -> String  {
        var num: String = "Address"
        var street: String = "not found"
        let query = addresses.select(street1910, number1910)
            .filter(street1911 == (direction + " " + streetName + " " + suffix) && number1911 == addressNum)
        
        do {
            if let firstRow = try db!.pluck(query) {
                num = firstRow.get(Expression<String>("Number1910")) //have to use string expression here
                street = firstRow.get(street1910)
            }
        } catch {
            print("Pluck row failed.")
        }
        
        return num + " " + street
    }
    
    static func getSingleton() -> Database {
        return instance
    }
    
   
}

