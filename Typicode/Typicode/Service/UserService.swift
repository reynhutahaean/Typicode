//
//  UserService.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserService {
    
    func getUser(userId : Int, successBlock:((_ isSuccess: Bool, _ userResponse: User) -> Void)?, errorBlock: ((_ error: String) -> Void)?) -> Void {
        
        print("url user : \(TheURLString.linkUser)")
        
        AF.request("\(TheURLString.SERVER_URL)\(TheURLString.linkUser)/\(userId)", method: .get, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            
            print("Response : \(response)")
            
            switch response.result {

            case .success(let value):
                let jsonObj = JSON(value)
                
                let success: Bool = true
                
                let users = User()
                users.populateJSON(jsonObj)
                
                successBlock!(success, users)
                
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
