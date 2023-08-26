//
//  Ex+ CLLocationCoordinate2D.swift
//  Yakssok
//
//  Created by Nayeon Kim on 2023/08/26.
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D {
    func distance(from: CLLocationCoordinate2D) -> String {
        let from = CLLocation(latitude: from.latitude, longitude: from.longitude)
        let to = CLLocation(latitude: self.latitude, longitude: self.longitude)
        
        let distance = Double(from.distance(from: to))
        var distanceStr = ""
        
        if distance >= 1000 {
            distanceStr = String(format: "%.2f", distance / 1000) + "km"
        } else {
            distanceStr = String(format: "%.0f", distance) + "m"
        }
        return distanceStr
    }
}
