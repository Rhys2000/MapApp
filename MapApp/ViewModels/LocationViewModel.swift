//
//  LocationViewModel.swift
//  MapApp
//
//  Created by Rhys Julian-Jones on 8/11/23.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    
    //All loaded locations
    @Published var locations: [Location]
  
    //Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locationData = LocationDataService.locations
        self.locations = locationData
        self.mapLocation = locationData.first!
        
        self.updateMapRegion(location: locationData.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
}
