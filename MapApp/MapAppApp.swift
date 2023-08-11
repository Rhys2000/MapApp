//
//  MapAppApp.swift
//  MapApp
//
//  Created by Rhys Julian-Jones on 8/10/23.
//

import SwiftUI

@main
struct MapAppApp: App {
    
    @StateObject private var vm = LocationViewModel()
     
    var body: some Scene {
        WindowGroup {
            LocationView().environmentObject(vm)
        }
    }
}
