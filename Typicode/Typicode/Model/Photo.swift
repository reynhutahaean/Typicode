//
//  Photo.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 18/12/21.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Photo: Object {
    @objc var albumId = 0
    @objc var id = 0
    @objc var title = ""
    @objc var url = ""
    @objc var thumbnailUrl = ""
    
    func populateJSON(_ json: JSON) {
        albumId = json["albumId"].intValue
        id = json["id"].intValue
        title = json["title"].stringValue
        url = json["url"].stringValue
        thumbnailUrl = json["thumbnailUrl"].stringValue
    }
}
