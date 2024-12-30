//
//  DataUploadView.swift
//  Map
//
//  Created by Zeynep Baran on 30.12.2024.
//

import SwiftUI
import FirebaseFirestore
import MapKit

struct DataUploadView: View {
    @StateObject private var uploadService = DataUploadService()
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var locationsVM: LocationsViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            if uploadService.isUploading {
                ProgressView()
                    .scaleEffect(1.5)
                    .padding()
                Text(uploadService.uploadMessage ?? "")
            } else {
                Text(uploadService.uploadMessage ?? "Firebase'e veri yüklemek için butona basın")
                    .multilineTextAlignment(.center)
            }
            
            Button(action: {
                uploadService.uploadInitialData { success in
                    if success {
                        // Verileri yeniden yükle
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            locationsVM.fetchLocations()
                            dismiss()
                        }
                    }
                }
            }) {
                Text(uploadService.uploadComplete ? "Yeniden Yükle" : "Lokasyonları Yükle")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .disabled(uploadService.isUploading)
            .padding(.horizontal)
            
            if !uploadService.isUploading {
                Button("Kapat") {
                    dismiss()
                }
                .padding(.top)
            }
        }
        .padding()
    }
}

