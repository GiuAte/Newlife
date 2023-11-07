//
//  ContactsView.swift
//  Newlife
//
//  Created by Giulio Aterno on 03/11/23.
//

import SwiftUI
import MapKit
import CoreLocation
import UIKit

struct MapView: View {
    
    @State private var userLocation: CLLocationCoordinate2D?
    @State private var selectedLocation: Location?
    @State var tracking: MapUserTrackingMode = .follow
    @StateObject var manager = LocationManager()
    @State private var markers: [MKPointAnnotation] = []
    @State private var selectedCoordinate: CLLocationCoordinate2D?
    @State private var route: MKPolyline?
    @State private var isSheetPresented = false
    @State private var selectedLocationMarker: MKPointAnnotation?
    @State private var selectedLocationIndex: Int?
    
    @State private var locations: [Location] = [
        Location(name: "Centro Raccolta Basile", address: "Via Ernesto Basile - Palermo", coordinate: CLLocationCoordinate2D(latitude: 38.1042, longitude: 13.3522), time: "Lun/Sat 07:00 - 13:00  Merc 07:00 - 17:00"),
        
        Location(name: "Centro Raccolta Lennon", address: "Via Antonio de Saliba, 6 - Palermo", coordinate: CLLocationCoordinate2D(latitude: 38.1278, longitude: 13.3332), time: "Lun/Sat 07 - 17:00  Dom 07:00 - 12:00"),
        
        Location(name: "Centro Raccolta Minutilla – La Malfa", address: "Via Salvatore Minutilla, 90146 - Palermo", coordinate: CLLocationCoordinate2D(latitude: 38.1614, longitude: 13.3006), time: "Lun/Sat 07:00 - 13:00"),
        
        Location(name: "Centro Raccolta Rotonda Oreto", address: "Viale Regione Siciliana, 90124 - Palermo", coordinate: CLLocationCoordinate2D(latitude: 38.0897, longitude: 13.3703), time: "Lun/Sat 07:00 - 17:00"),
        
        Location(name: "Centro Raccolta Nicoletti", address: "Via Rosario Nicoletti, 73 - Palermo", coordinate: CLLocationCoordinate2D(latitude: 38.1924, longitude: 13.2832), time: "Lun/Sat 07:00 - 17:00 Dom 07:00 - 12:00"),
        
        Location(name: "Centro Raccolta Pace", address: "Piazza della Pace, 90139 - Palermo", coordinate: CLLocationCoordinate2D(latitude: 38.1333, longitude: 13.3572), time: "Lun/Sat 07:00 - 13:00 Mar e Gio 07:00 - 17:00"),
        
        Location(name: "Centro Raccolta Picciotti", address: "Viale dei Picciotti, 84, 90123 - Palermo", coordinate: CLLocationCoordinate2D(latitude: 38.0971, longitude: 13.3846), time: "Lun/Sat 07:00 - 17:00 Dom 07:00 - 12:00")
        
    ]
    
    var body: some View {
        ZStack {
            Color.whiteBackground.ignoresSafeArea()
            Map(
                coordinateRegion: $manager.region,
                //interactionModes: MapInteractionModes.all,
                showsUserLocation: true
            )
            .ignoresSafeArea()
            .onAppear {
                addMarkers()
                isSheetPresented = true
            }
            VStack {
                Spacer()
                bottomContainerView
                    .presentationDetents([.medium, .fraction(0.25)])
                    .presentationDragIndicator(.visible)
                    .frame(maxWidth: .infinity)
            }
        }
    }
    
    private func openDirections(for location: Location) {
        if let coordinate = location.coordinate {
            let placemark = MKPlacemark(coordinate: coordinate)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = location.name
            mapItem.openInMaps()
        }
    }
    
    private func addMarkers() {
        for location in locations {
            if let coordinate = location.coordinate {
                let marker = MKPointAnnotation()
                marker.coordinate = coordinate
                marker.title = location.name
                marker.subtitle = location.address
                //manager.addAnnotation(marker)
            }
        }
    }
    
    private var bottomContainerView: some View {
        VStack {
            List {
                ForEach(0..<locations.count, id: \.self) { index in
                    let location = locations[index]
                    VStack(alignment: .leading) {
                        Text(location.name)
                            .font(.headline)
                            .onTapGesture {
                                selectedLocationIndex = index
                            }
                        Text(location.address)
                            .font(.subheadline)
                            .fontWeight(.thin)
                            .italic()
                        Text("\(location.time)")
                            .font(.subheadline)
                            .fontWeight(.light)
                        HStack {
                            Spacer()
                            Button(action: {
                                openDirections(for: location)
                            }, label: {
                                HStack {
                                    Text("Ottieni indicazioni")
                                        .foregroundStyle(Color.white)
                                    Image(systemName: "car.fill")
                                        .foregroundStyle(Color.white)
                                }
                            })
                            Spacer()
                        }
                        .frame(width: 190, height: 40)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("Green")))
                    }
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: 350)
            .scrollContentBackground(.hidden)
            .scrollIndicators(.never)
        }
    }
}


struct Location: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    var coordinate: CLLocationCoordinate2D?
    var time: String
    
    init(name: String, address: String, coordinate: CLLocationCoordinate2D?, time: String) {
        self.name = name
        self.address = address
        self.coordinate = coordinate
        self.time = time
    }
}


#Preview {
    MapView()
}

