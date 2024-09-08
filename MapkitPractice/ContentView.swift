//
//  ContentView.swift
//  MapkitPractice
//
//  Created by 水元太陽 on 2024/09/08.
//

import SwiftUI
import MapKit

struct ContentView: View {
  @ObservedObject var manager = LocationManager()
  
  @State var trackingMode = MapUserTrackingMode.follow
  var body: some View {
    Map (coordinateRegion: $manager.region,
         showsUserLocation: true,
         userTrackingMode: $trackingMode
    ).edgesIgnoringSafeArea(.bottom)
  }
}

#Preview {
  ContentView()
}
