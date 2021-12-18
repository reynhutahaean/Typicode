//
//  Post.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Post: Object {
    @objc var userId = 0
    @objc var id = 0
    @objc var title = ""
    @objc var body = ""
    
    func populateJSON(_ json: JSON) {
        userId = json["userId"].intValue
        id = json["id"].intValue
        title = json["title"].stringValue
        body = json["body"].stringValue
    }
}
