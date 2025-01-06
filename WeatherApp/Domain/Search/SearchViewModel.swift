//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Published var locations: [LocationItem] = []
    
}
