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
    let dataManager: DataManagerProtocol
            
    init(apiManager: APIManagerProtocol = APIManager.shared, dataManager: DataManagerProtocol = DataCoreManager.shared) {
        self.apiManager = apiManager
        self.dataManager = dataManager
    }
    
}
