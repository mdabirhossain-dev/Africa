//
//  MapView.swift
//  Africa
//
//  Created by Md Abir Hossain on 16-04-2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locatoin: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - BODY
    
    var body: some View {
        // MARK: - No1 Basic Map
        VStack {
            Map(coordinateRegion: $region, annotationItems: locatoin) { item in
                // (A) PIN: OLD STYLE (alwyas static)
//                MapPin(coordinate: item.location, tint: .accentColor)
                
                // (B) MARKER: NEW STYLE (alwyas static)
//                MapMarker(coordinate: item.location, tint: .accentColor)
                
                // (C) CUSTOM BASIC ANNOTATION (it could be interactive)
                MapAnnotation(coordinate: item.location) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)
                } //: ANNOTATION
            }
        }
    }
}

// MARK: - PREVIEW

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
