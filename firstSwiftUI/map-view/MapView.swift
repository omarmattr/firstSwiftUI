//
//  MapView.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 06/08/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var viewModel = MapViewModel()
    var body: some View {
        Map(coordinateRegion: $viewModel.region,showsUserLocation: true).ignoresSafeArea().accentColor(.red)
            .onAppear{
                viewModel.checkLocaationIfEnabled()
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
