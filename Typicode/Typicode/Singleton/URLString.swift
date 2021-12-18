//
//  URLString.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import Foundation

let TheURLString = URLString.sharedInstance

class URLString {
    class var sharedInstance: URLString {
        struct Static {
            static let instance: URLString = URLString()
        }
        return Static.instance
    }
    
    let SERVER_URL = "https://jsonplaceholder.typicode.com"
    
    //Endpoint
    let linkPost = "/posts"
    let linkUser = "/users"
    let linkComment = "/comments"
    let linkAlbum = "/albums"
    let linkPhoto = "/photos"
}
