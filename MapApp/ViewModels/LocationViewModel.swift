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
    
    //Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //Show list of location
    @Published var showLocationList: Bool = false
    
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
    
    func toggleLocationList() {
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
}
