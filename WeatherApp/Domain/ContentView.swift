//
//  ContentView.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 2/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var runningSplash = true
    
    var body: some View {
        Group {
            if self.runningSplash {
                SplashView()
            } else {
                SearchView()
            }
        }.task {
            try? await Task.sleep(nanoseconds: 3_000_000_000)
            self.runningSplash.toggle()
        }
    }
}

#Preview {
    return ContentView()
}
