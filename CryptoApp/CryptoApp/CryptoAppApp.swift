//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Karamjeet Singh on 10/07/24.
//

import SwiftUI

@main
struct CryptoAppApp: App {

    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
           // ContentView()
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
