//
//  LocationView.swift
//  SwiftfulMapApp
//
//  Created by 우주형 on 2023/01/26.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationsViewModel())
    }
}
