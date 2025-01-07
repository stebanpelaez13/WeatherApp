//
//  FavouritesViewModel.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import SwiftUI

class FavouritesViewModel: BaseViewModel, ObservableObject {
    
    @Published var favourites: [LocationItem] = []
    
    func fetchFavourites() {
        self.favourites = self.dataManager.fetchFavourites()
    }
    
}
