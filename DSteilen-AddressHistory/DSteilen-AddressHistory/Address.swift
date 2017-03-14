//
//  Address.swift
//  DSteilen-AddressHistory
//
//  Created by Daniel Steilen on 3/13/17.
//  Copyright © 2017 DSteilen. All rights reserved.
//

import Foundation

class Address {
    let number: Int
    let street: String
    
    init(_ number: Int, _ street: String) {
        self.number = number
        self.street = street
    }
}
