//
//  LocationViewModel.swift
//  MapApp
//
//  Created by Rhys Julian-Jones on 8/11/23.
//

import Foundation

class LocationViewModel: ObservableObject {
    @Published var locations: [Location]
    
    init() {
        self.locations = LocationsDataService.locations
    }
}
