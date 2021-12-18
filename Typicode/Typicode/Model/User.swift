//
//  User.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import Foundation
import RealmSwift
import SwiftyJSON

class User: Object {
    @objc var id = 0
    @objc var name = ""
    @objc var username = ""
    @objc var email = ""
    @objc var street = ""
    @objc var suite = ""
    @objc var city = ""
    @objc var zipcode = ""
    @objc var lat = ""
    @objc var lng = ""
    @objc var companyName = ""
    @objc var catchPhrase = ""
    @objc var bs = ""
    
    func populateJSON(_ json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        username = json["username"].stringValue
        email = json["email"].stringValue
        street = json["address"]["street"].stringValue
        suite = json["address"]["suite"].stringValue
        city = json["address"]["city"].stringValue
        zipcode = json["address"]["zipcode"].stringValue
        lat = json["address"]["geo"]["lat"].stringValue
        lng = json["address"]["geo"]["lng"].stringValue
        companyName = json["company"]["name"].stringValue
        catchPhrase = json["company"]["catchPhrase"].stringValue
        bs = json["company"]["bs"].stringValue
    }
}
