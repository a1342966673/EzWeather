//
//  CaiYunJsonVDay.swift
//  tianqi
//
//  Created by RemiliaScarlet on 2021/1/18.
//

import Foundation
import SwiftyJSON
import Alamofire

class CaiYunJsonVDay: LocationViewModel {
    @Published var today = [String:JSON]()
    @Published var IIDay = [String:JSON]()
    @Published var IIIDay = [String:JSON]()
    @Published var IVDay = [String:JSON]()
    @Published var VDay = [String:JSON]()
    
    let cyToken = "HYzglwyB98oRNaYL"
    var cyUrl: URL { URL(string: "https://api.caiyunapp.com/v2.5/\(cyToken)/\(userLongitude),\(userLatitude)/weather.json")! }
    //https://api.caiyunapp.com/v2.5/HYzglwyB98oRNaYL/121.6544,25.1552/hourly.json
    func cyNetworkStart() {
        print(cyUrl)
        AF.request(cyUrl).responseJSON{
            (response) in
            switch response.result{
            case .success:
                if let value = response.value{
                    let json = JSON(value)
                  
                    if let number = json["result"]["daily"]["temperature"][0].dictionary{
                        self.today = number
                        //print(self.today["min"])
                    }
                }
                break
            case .failure(let error):
                print("error:\(error)")
                break
            }
        }
    }
    
}
