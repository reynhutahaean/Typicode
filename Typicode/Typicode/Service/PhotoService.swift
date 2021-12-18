//
//  PhotoService.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 18/12/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class PhotoService {
    
    func getPhoto(albumId: Int, successBlock:((_ isSuccess: Bool, _ photoResponse: [Photo]) -> Void)?, errorBlock: ((_ error: String) -> Void)?) -> Void {
        
        print("url photo : \(TheURLString.linkPhoto)")
        
        AF.request("\(TheURLString.SERVER_URL)\(TheURLString.linkAlbum)/\(albumId)\(TheURLString.linkPhoto)", method: .get, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            
            print("Response : \(response)")
            
            switch response.result {

            case .success(let value):
                let jsonObj = JSON(value)
                
                let success: Bool = true
                
                var photos = [Photo]()
                
                for i in 0..<jsonObj.count {
                    let thePhotos = Photo()
                    thePhotos.populateJSON(jsonObj[i])
                    photos.append(thePhotos)
                }
                
                successBlock!(success, photos)
                
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
