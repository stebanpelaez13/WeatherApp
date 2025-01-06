//
//  BaseViewModel.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 5/01/25.
//

import Foundation
import Combine

class BaseViewModel {
    
    var cancellables = Set<AnyCancellable>()
    
    let apiManager: APIManagerProtocol
            
    init(apiManager: APIManagerProtocol = APIManager.shared) {
        self.apiManager = apiManager
    }
    
}
