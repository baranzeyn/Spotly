//
//  LocationsView.swift
//  Map
//
//  Created by Zeynep Baran on 27.12.2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    @State private var showUploadPanel = false
    let maxWidthForIpad: CGFloat = 700
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ZStack(alignment: .topTrailing) {
                    header
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                    
                    // Upload butonu
                    Button(action: { showUploadPanel = true }) {
                        Image(systemName: "arrow.up.to.line")
                            .font(.title2)
                            .padding(10)
                            .background(.thinMaterial)
                            .clipShape(Circle())
                    }
                    .padding()
                }
                
                Spacer()
                locationsPreviewStack
            }
        }
        .sheet(isPresented: $showUploadPanel) {
            NavigationView {
                DataUploadView()
                    .navigationTitle("Veri Yükleme")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .presentationDetents([.height(300)])
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

// View bileşenleri aynı kalacak...

// MARK: - View Components
extension LocationsView {
    private var header: some View {
        VStack {
            if let mapLocation = vm.mapLocation {
                Button(action: vm.toggleLocationsList) {
                    Text(mapLocation.name + ", " + mapLocation.cityName)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .animation(.none, value: mapLocation)
                        .overlay(alignment: .leading) {
                            Image(systemName: "arrow.down")
                                .font(.headline)
                                .foregroundStyle(.black)
                                .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                                .padding()
                        }
                }
                
                if vm.showLocationsList {
                    LocationsListView()
                }
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
            })
    }
    
    private var locationsPreviewStack: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxWidth: .infinity)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                }
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
