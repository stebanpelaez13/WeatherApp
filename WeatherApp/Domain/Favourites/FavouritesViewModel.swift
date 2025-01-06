//
//  FavouritesViewModel.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import SwiftUI

class FavouritesViewModel: ObservableObject {
    
    @Published var favourites: [LocationItem] = []

}
