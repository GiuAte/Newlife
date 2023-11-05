//
//  ScanView.swift
//  Newlife
//
//  Created by Giulio Aterno on 03/11/23.
//

import SwiftUI
import VisionKit

struct ViewInsideScanView: View {
    
    @EnvironmentObject var vm: ScannerDataViewModel
    @State private var isSheetPresented = true
        
        private let textContentTypes: [(title: String, textContentType: DataScannerViewController.TextContentType?)] = [
            ("All", .none),
            ("URL", .URL),
            ("Telefono", .telephoneNumber),
            ("Email", .emailAddress),
            ("Indirizzo", .fullStreetAddress)
        ]
        
        var body: some View {
            switch vm.dataScannerAccessStatus {
            case .scannerAvailable:
                mainView
            case .cameraNotAvailable:
                Text("Il tuo dispositivo non ha una fotocamera.")
            case .scannerNotAvailable:
                Text("Il tuo dispositivo non supporta la scansione.")
            case .cameraAccessNotGranted:
                Text("Fornisci l'accesso alla Fotocamera dalle impostazioni.")
            case .notDetermined:
                Text("Richiesta accesso alla Fotocamera.")
            }
        }
        
        private var mainView: some View {
            DataScannerView(
                recognizedItems: $vm.recognizedItems,
                recognizedDataType: vm.recognizedDataType,
                recognizesMultipleItems: vm.recognizesMultipleItems)
            .background { Color.gray.opacity(0.3) }
            .ignoresSafeArea()
            .id(vm.dataScannerViewId)
            .sheet(isPresented: $isSheetPresented) {
                bottomContainerView
                    .background(.ultraThinMaterial)
                    .presentationDetents([.medium, .fraction(0.25)])
                    .presentationDragIndicator(.visible)
                    .onAppear {
                        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                              let controller = windowScene.windows.first?.rootViewController?.presentedViewController else {
                            return
                        }
                        controller.view.backgroundColor = .clear
                    }
            }
            .onChange(of: vm.scanType) { _ in vm.recognizedItems = [] }
            .onChange(of: vm.textContentType) { _ in vm.recognizedItems = [] }
            .onChange(of: vm.recognizesMultipleItems) { _ in vm.recognizedItems = []}
        }
        
        private var headerView: some View {
            VStack {
                HStack {
                    Picker("Tipo di scansione", selection: $vm.scanType) {
                        Text("Barcode").tag(ScanType.barcode)
                        Text("Testo").tag(ScanType.text)
                    }.pickerStyle(.segmented)
                    
                    Toggle("Scansione multipla", isOn: $vm.recognizesMultipleItems)
                }.padding(.top)
                
                if vm.scanType == .text {
                    Picker("Tipo di testo", selection: $vm.textContentType) {
                        ForEach(textContentTypes, id: \.self.textContentType) { option in
                            Text(option.title).tag(option.textContentType)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Text(vm.headerText).padding(.top)
            }.padding(.horizontal)
        }
        
        private var bottomContainerView: some View {
            VStack {
                headerView
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(vm.recognizedItems) { item in
                            switch item {
                            case .barcode(let barcode):
                                Text(barcode.payloadStringValue ?? "Barcode sconosciuto")
                                
                            case .text(let text):
                                Text(text.transcript)
                                
                            @unknown default:
                                Text("Sconosciuto")
                            }
                        }
                    }
                    .padding()
                }
            }
        }
}

