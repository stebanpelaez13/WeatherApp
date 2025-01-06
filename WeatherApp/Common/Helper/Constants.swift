//
//  Constants.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import Foundation

enum Constants {
    
    enum Network {
        
        static let urlBase = "https://api.weatherapi.com"
        static let endPointSearch = "v1/search.json"
        static let endPointWeather = "v1/forecast.json"
        
        static let dayValue = "3"
        static let apiKey = "de5553176da64306b86153651221606"
        
        static let idKey = "id:"
        static let keyName = "key"
        static let queryName = "q"
        static let dayName = "days"
    }
    
    enum Messages {
        static let titleSplash = "Weather APP"
        static let titleSearch = "Locations"
        static let titleFavourites = "Favourites"
        
        static let placeholder = "Search for name city"
        static let notFovourites = "No favourites"
        static let notMatches = "No matches found"
    }
    
    enum Images {
        static let startFill = "star.fill"
        static let start = "star"
        
        static let drop = "drop.fill"
        static let sun = "sun.max.fill"
    }
    
}
