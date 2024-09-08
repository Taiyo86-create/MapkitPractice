//
//  LocationManager.swift
//  MapkitPractice
//
//  Created by 水元太陽 on 2024/09/08.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
  let manager = CLLocationManager()
  
  @Published var region = MKCoordinateRegion()
  
  override init() {
    super.init()
    manager.delegate = self
    manager.requestWhenInUseAuthorization()
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.distanceFilter = 2
    manager.startUpdatingLocation()
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    locations.last.map {
      let center = CLLocationCoordinate2D(
        latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude
      )
      
      region = MKCoordinateRegion(
        center: center,
        latitudinalMeters: 100.0,
        longitudinalMeters: 100.0
      )
    }
  }
}

