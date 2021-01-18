//
//  LocantionAndNetwork.swift
//  tianqi
//
//  Created by RemiliaScarlet on 2021/1/1.
//

import Foundation
import CoreLocation

class LocationViewModel: NSObject, ObservableObject{
    
    @Published var userLatitude: Double = 39.9165
    @Published var userLongitude: Double = 116.3971
    @Published var myLocalArea = "000"
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print("开始获取坐标信息")
        guard let location = locations.last else { return }
        
        userLatitude = location.coordinate.latitude
        userLongitude = location.coordinate.longitude
        
        GetAreaLocation()//获取地理信息
        
    }
    
    func GetAreaLocation(){
        
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: userLatitude, longitude: userLongitude)
        geoCoder.reverseGeocodeLocation(location, completionHandler:
                                            {
                                                placemarks, error -> Void in
                                                
                                                // Place details
                                                guard let placeMark = placemarks?.first else { return }
                                                
                                                if let city = placeMark.locality {
                                                    //print("城",city)
                                                    self.myLocalArea = city
                                                }
                                                // City area
                                                if let area = placeMark.subLocality {
                                                    //print("区",area)
                                                    self.myLocalArea += area
                                                }
                                                //print(self.myLocalArea)
                                            })
    }
    
}
