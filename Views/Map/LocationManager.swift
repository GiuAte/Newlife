//
//  LocationManager.swift
//  Newlife
//
//  Created by Giulio Aterno on 07/11/23.
//

import UIKit
import MapKit

class LocationManager: NSObject,CLLocationManagerDelegate, ObservableObject {
    
    @Published var region = MKCoordinateRegion()
    private let manager = CLLocationManager()
    
    override init() {
            super.init()
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            let adjustedLatitude = $0.coordinate.latitude - 0.240
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: adjustedLatitude, longitude: $0.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            )
        }
    }
}
