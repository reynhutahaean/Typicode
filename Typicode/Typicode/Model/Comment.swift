//
//  Comment.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Comment: Object {
    @objc var postId = 0
    @objc var id = 0
    @objc var name = ""
    @objc var body = ""
    
    func populateJSON(_ json: JSON) {
        postId = json["postId"].intValue
        id = json["id"].intValue
        name = json["name"].stringValue
        body = json["body"].stringValue
    }
}
