//
//  FavouritesView.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import SwiftUI

struct FavouritesView: View {
    
    @EnvironmentObject var router: SearchRouter
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    FavouritesView()
        .environmentObject(SearchRouter())
}
