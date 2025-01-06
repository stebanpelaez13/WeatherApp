//
//  SearchRouter.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import SwiftUI

class SearchRouter: ObservableObject {
    
    enum Router: Hashable, Equatable, Identifiable {
        var id: String { String(self.hashValue) }
        
        case detail
        case favourites
        
        static func == (lhs: Router, rhs: Router) -> Bool {
            return lhs.hashValue == rhs.hashValue
        }
        
        func hash(into hasher: inout Hasher) {
            switch self {
            case .detail:
                return hasher.combine(1)
            case .favourites:
                return hasher.combine(2)
            }
        }
    }
    
    @Published var path: [Router] = []
    
    @ViewBuilder func view(for route: Router) -> some View {
        switch route {
        case .detail:
            DetailView()
        case .favourites:
            FavouritesView()
        }
    }
    
    func navigateTo(_ appRoute: Router) {
        self.path.append(appRoute)
    }
    
    func navigateBack() {
        self.path.removeLast()
    }
    
}
