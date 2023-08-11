//
//  LocationView.swift
//  MapApp
//
//  Created by Rhys Julian-Jones on 8/11/23.
//

import SwiftUI

struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) {
                Text($0.name)
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView().environmentObject(LocationViewModel())
    }
}
