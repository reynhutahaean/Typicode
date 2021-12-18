//
//  AlbumService.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 18/12/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class AlbumService {
    
    func getAlbum(userId: Int, successBlock:((_ isSuccess: Bool, _ albumResponse: [Album]) -> Void)?, errorBlock: ((_ error: String) -> Void)?) -> Void {
        
        print("url album : \(TheURLString.linkAlbum)")
        
        AF.request("\(TheURLString.SERVER_URL)\(TheURLString.linkUser)/\(userId)\(TheURLString.linkAlbum)", method: .get, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            
            print("Response : \(response)")
            
            switch response.result {

            case .success(let value):
                let jsonObj = JSON(value)
                
                let success: Bool = true
                
                var albums = [Album]()
                
                for i in 0..<jsonObj.count {
                    let theAlbums = Album()
                    theAlbums.populateJSON(jsonObj[i])
                    albums.append(theAlbums)
                }
                
                successBlock!(success, albums)
                
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
