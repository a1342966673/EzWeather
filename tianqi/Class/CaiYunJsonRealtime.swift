//
//  CyJsonAndMoya.swift
//  tianqi
//
//  Created by RemiliaScarlet on 2021/1/5.
//

import Foundation
import Alamofire
import SwiftyJSON

class CaiYunJsonRealtime:LocationViewModel {
    
    @Published var nowTem = 0//当前温度
    @Published var airQuality = ""//空气质量
    @Published var windDirection = ""//风向
    @Published var humidity = 0//湿度
    @Published var skycon = ""
    
    //var cyJsonRealtime = ""
    let cyToken = "HYzglwyB98oRNaYL"
    var cyUrl: URL { URL(string: "https://api.caiyunapp.com/v2.5/\(cyToken)/\(userLongitude),\(userLatitude)/realtime.json")! }
    
    func cyNetworkStart() {
        print(cyUrl)
        AF.request(cyUrl).responseJSON{
            (response) in
            switch response.result{
            case .success:
                if let value = response.value{
                    let json = JSON(value)
                    //print(json)
                    if let number = json["result"]["realtime"]["temperature"].int{
                        self.nowTem = number
                        print("当前温度",self.nowTem)
                    }
                    if let number = json["result"]["realtime"]["air_quality"]["description"]["chn"].string{
                        self.airQuality = number
                        print("当前空气质量",self.airQuality)
                    }
                    if let number = json["result"]["realtime"]["wind"]["direction"].double{
                        switch number {
                        case 0..<10:
                            self.windDirection = "北风"
                        case 11..<80:
                            self.windDirection = "东北风"
                        case 81..<110:
                            self.windDirection = "东风"
                        case 111..<170:
                            self.windDirection = "东南风"
                        case 171..<190:
                            self.windDirection = "南风"
                        case 191..<260:
                            self.windDirection = "西南风"
                        case 261..<280:
                            self.windDirection = "西风"
                        case 281..<350:
                            self.windDirection = "西北风"
                        default:
                            self.windDirection = "北风"
                        }
                        print("当前风向",self.windDirection)
                    }
                    if let number = json["result"]["realtime"]["humidity"].double{
                        self.humidity = Int(number * 100)
                        print("当前湿度",self.humidity)
                    }
                    if let number = json["result"]["realtime"]["skycon"].string{
                        self.skycon = number
                        print("当前天气情况",self.skycon)
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

class CaiyunJsonXXIV: LocationViewModel {
    @Published var highTem: [Double] = []
    @Published var highTem2: [Double] = []
    
    let cyToken = "HYzglwyB98oRNaYL"
    var cyUrl: URL { URL(string: "https://api.caiyunapp.com/v2.5/\(cyToken)/\(userLongitude),\(userLatitude)/hourly.json")! }
    
    func cyNetworkStartXXIV()  {
        
        let queue = DispatchQueue.main
        queue.async {
            //开新线程
            print(self.cyUrl)
            AF.request(self.cyUrl).responseJSON{ [self]
                (response) in
                switch response.result{
                case .success:
                    if let value = response.value{
                        let json = JSON(value)
                        //获得json数据，开始swiftyjson解析
                        for index in 0...23 {
                            if let number = json["result"]["hourly"]["temperature"][index]["value"].double{
                                //print(number)
                                self.highTem.append(number)
                                //print(self.highTem)
                            }
                        }//遍历写入前24小时温度
                        for index in 24...json["result"]["hourly"]["temperature"].count {
                            if let number = json["result"]["hourly"]["temperature"][index]["value"].double{
                                //print(number)
                                self.highTem2.append(number)
                                //print(self.highTem)
                            }
                        }//遍历写入后24小时温度
                        
                        
                    }
                    break
                    
                case .failure(let error):
                    print("error\(error)")
                    break
                }
            }
        }
    }
    
}
