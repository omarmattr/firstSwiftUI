//
//  MapViewModel.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 06/08/2022.
//

import Foundation
import MapKit

enum MapDetails{
    static let startingLocation=CLLocationCoordinate2D(latitude:37.331516,longitude:-121.891054)
    static let defaultSpan=MKCoordinateSpan(latitudeDelta:0.05,longitudeDelta:0.05)
}

final class MapViewModel : NSObject,ObservableObject, CLLocationManagerDelegate{
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    var locationManager:CLLocationManager?
    func checkLocaationIfEnabled(){
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            print("ccccc")
        }else{
            print("ccccc")
        }
        
    }
   private func checkAuthLocation(){
        guard let locationManager = locationManager else {return}
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways , .authorizedWhenInUse:
            region  = MKCoordinateRegion(center:locationManager.location!.coordinate,
                                         span:MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthLocation()
    }
    
}
