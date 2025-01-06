//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import SwiftUI

class SearchViewModel: BaseViewModel, ObservableObject {
    
    @Published var locations: [LocationItem] = []
    
    func searchLocations(query: String) {
        
        let cleanQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if cleanQuery.isEmpty {
            self.locations.removeAll()
            return
        }
        
        
        let params: [String: String] = [Constants.Network.keyName: Constants.Network.apiKey,
                                        Constants.Network.queryName: cleanQuery]
        
        let request = APIRequestBuilder(urlApi: Constants.Network.urlBase)
            .withEndPoint(Constants.Network.endPointSearch)
            .withParams(params)
            .build()
        
        self.apiManager.fetchData(request: request, type: [LocationItem].self)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    print(error)
                    self?.locations.removeAll()
                }
            } receiveValue: { [weak self] locations in
                self?.processLocations(query: cleanQuery, locations)
            }.store(in: &self.cancellables)
    }
    
    private func processLocations(query: String, _ locations: [LocationItem]) {
        print("Call Api query='\(query)' : \(locations.count)")
        self.locations = locations
    }
    
}
