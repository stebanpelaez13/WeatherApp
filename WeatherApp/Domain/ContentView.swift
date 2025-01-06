//
//  ContentView.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 2/01/25.
//

import SwiftUI

struct ContentView: View {
    
    private let duration = 4
    @State private var runningSplash = true
    
    var body: some View {
        Group {
            if self.runningSplash {
                SplashView(duration: self.duration)
            } else {
                SearchView()
            }
        }.task {
            try? await Task.sleep(nanoseconds: UInt64(1_000_000_000*self.duration))
            self.runningSplash.toggle()
        }
    }
}

#Preview {
    return ContentView()
}
