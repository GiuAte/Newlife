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

struct ContactsView: View {
    
    @State private var userLocation: CLLocationCoordinate2D?
    @State private var selectedLocation: Location?
    @State private var locations: [Location] = [
        Location(name: "Centro Raccolta Basile", address: "Via Ernesto Basile, Parcheggio Basile - Palermo", coordinate: CLLocationCoordinate2D(latitude: 38.1042, longitude: 13.3522)),
        Location(name: "Centro Raccolta Lennon", address: "Via Antonio de Saliba, 6 - Palermo", coordinate: CLLocationCoordinate2D(latitude: 38.1278, longitude: 13.3332)),
        Location(name: "Centro Raccolta Minutilla – La Malfa", address: "Via Salvatore Minutilla, 90146 - Palermo", coordinate: CLLocationCoordinate2D(latitude: 38.1614, longitude: 13.3006)),
        Location(name: "Centro Raccolta Rotonda Oreto", address: "Viale Regione Siciliana, 90124 - Palermo", coordinate: CLLocationCoordinate2D(latitude: 38.0897, longitude: 13.3703)),
        Location(name: "Centro Raccolta Nicoletti", address: "Via Rosario Nicoletti, 73 - Palermo", coordinate: CLLocationCoordinate2D(latitude: 38.1924, longitude: 13.2832)),
        Location(name: "Centro Raccolta Pace", address: "Piazza della Pace, 90139 - Palermo", coordinate: CLLocationCoordinate2D(latitude: 38.1333, longitude: 13.3572)),
        Location(name: "Centro Raccolta Picciotti", address: "Viale dei Picciotti, 84, 90123 - Palermo", coordinate: CLLocationCoordinate2D(latitude: 38.0971, longitude: 13.3846))
        
    ]
    
    @State private var markers: [MKPointAnnotation] = []
    @State private var selectedCoordinate: CLLocationCoordinate2D?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.whiteBackground.ignoresSafeArea()
                VStack {
                    Map(
                        coordinateRegion: .constant(MKCoordinateRegion(
                            center: userLocation ?? CLLocationCoordinate2D(latitude: 38.1, longitude: 13.36),
                            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                        )),
                        showsUserLocation: true
                    )
                    .frame(height: .infinity)
                    .cornerRadius(10)
                    .ignoresSafeArea()
                    .onAppear {
                        addMarkers()
                        requestLocationPermission()
                    }
                    
                    List {
                        ForEach(0..<locations.count, id: \.self) { index in
                            VStack(alignment: .leading) {
                                Text(locations[index].name)
                                    .font(.headline)
                                    .onTapGesture {
                                        selectedLocation = locations[index]
                                        selectedCoordinate = locations[index].coordinate
                                    }
                                Text("\(locations[index].address)")
                                    .font(.subheadline)
                                Button(action: {
                                    openDirections(for: locations[index])
                                }) {
                                    HStack {
                                        Text("Ottieni indicazioni")
                                            .bold()
                                        Image(systemName: "car.fill")
                                            .padding(.leading)
                                    }
                                }
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .frame(width: .infinity)
                }
            }
        }
        .navigationTitle("Mappa")
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.automatic)
    }
    
    private func requestLocationPermission() {
        // Puoi implementare la richiesta di autorizzazione e la gestione dei delegati di Core Location qui.
        // Assicurati di impostare userLocation con le coordinate della posizione dell'utente.
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
                markers.append(marker)
            }
        }
    }
}

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    var coordinate: CLLocationCoordinate2D?
}


#Preview {
    ContactsView()
}

