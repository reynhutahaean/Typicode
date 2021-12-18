//
//  CommentService.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class CommentService {
    
    func getComment(postId: Int, successBlock:((_ isSuccess: Bool, _ commentResponse: [Comment]) -> Void)?, errorBlock: ((_ error: String) -> Void)?) -> Void {
        
        print("url comment : \(TheURLString.linkComment)")
        
        AF.request("\(TheURLString.SERVER_URL)\(TheURLString.linkPost)/\(postId)\(TheURLString.linkComment)", method: .get, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            
            print("Response : \(response)")
            
            switch response.result {

            case .success(let value):
                let jsonObj = JSON(value)
                
                let success: Bool = true
                
                var comments = [Comment]()
                
                for i in 0..<jsonObj.count {
                    let theComments = Comment()
                    theComments.populateJSON(jsonObj[i])
                    comments.append(theComments)
                }
                
                successBlock!(success, comments)
                
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
