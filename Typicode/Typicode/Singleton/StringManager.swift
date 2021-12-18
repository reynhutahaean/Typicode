//
//  StringManager.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import Foundation

let TheStringManager = StringManager.sharedInstance

class StringManager {
    
    class var sharedInstance: StringManager {
        struct Static {
            static let instance: StringManager = StringManager()
        }
        return Static.instance
    }
    
    //MARK: B
    let bs = "BS"
    
    //MARK: C
    let catchPhrase = "Catch Phrase"
    let city = "City"
    let company = "Company"
    
    //MARK: D
    let detail = "Detail"
    
    //MARK: N
    let name = "Name"
    
    //MARK: P
    let photo = "Photo"
    
    //MARK: S
    let street = "Street"
    let suite = "Suite"
    
    //MARK: U
    let user = "User"
    
    //MARK: Z
    let zipcode = "Zipcode"
}
