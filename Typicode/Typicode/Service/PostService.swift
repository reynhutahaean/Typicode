//
//  PostService.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class PostService {
    
    func getPost(successBlock:((_ isSuccess: Bool, _ postResponse: [Post]) -> Void)?, errorBlock: ((_ error: String) -> Void)?) -> Void {
        
        print("url posts : \(TheURLString.linkPost)")
        
        AF.request("\(TheURLString.SERVER_URL)\(TheURLString.linkPost)", method: .get, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            
            print("Response : \(response)")
            
            switch response.result {

            case .success(let value):
                let jsonObj = JSON(value)
                
                let success: Bool = true
                
                var posts = [Post]()
                
                for i in 0..<jsonObj.count {
                    let thePosts = Post()
                    thePosts.populateJSON(jsonObj[i])
                    posts.append(thePosts)
                }
                
                successBlock!(success, posts)
                
            case .failure(let error):
                print(error)
                let reachabiityManager = NetworkReachabilityManager()
                if  reachabiityManager?.isReachable ?? false {
                    let statusCode = "\(response.response?.statusCode ?? 0)"
                    print("statuscode", statusCode)
                    print("\(statusCode) : Server Tidak Tersedia")
                } else {
                    print("-1", "Periksa Koneksi Internet")
                }
            }
        }
    }
}
