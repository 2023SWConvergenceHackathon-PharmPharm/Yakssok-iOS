//
//  PathOverlayView.swift
//  Yakssok
//
//  Created by Nayeon Kim on 2023/08/26.
//

import SwiftUI
import MapKit

struct PathOverlayView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    
    @State var marker1 = MKPointAnnotation()
    @State var marker2 = MKPointAnnotation()
    @Binding var home: CLLocationCoordinate2D
    @Binding var destination: Place?
    @Binding var directions: [String]
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let region = MKCoordinateRegion(
            center: home,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        mapView.showsCompass = false
        
        let p1 = MKPlacemark(coordinate: home)
        let p2 = MKPlacemark(coordinate: destination!.coordinate)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: p1)
        request.destination = MKMapItem(placemark: p2)
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let route = response?.routes.first else { return }
            marker1.title = "start"
            marker1.coordinate = p1.coordinate
            marker2.title = "end"
            marker2.coordinate = p2.coordinate
            mapView.addAnnotations([marker1, marker2])
            mapView.addOverlay(route.polyline)
            mapView.setVisibleMapRect(
                route.polyline.boundingMapRect,
                edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
                animated: true)
            self.directions = route.steps.map { $0.instructions }.filter { !$0.isEmpty }
        }
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor(ColorTheme().primary.main)
            renderer.lineWidth = 10
            return renderer
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation {
                return nil
            }
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
            
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            } else {
                annotationView?.annotation = annotation
            }
            
            switch annotation.title {
            case "start":
                //TODO: 팝업
                annotationView?.image = UIImage(named: "Start")
            case "end":
                annotationView?.image = UIImage(named: "End")
            default:
                break
            }
            
            return annotationView
        }
    }
}
