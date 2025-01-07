//
//  DetailViewModel.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 1/01/25.
//

import SwiftUI
import Combine

class DetailViewModel: BaseViewModel, ObservableObject {
    
    @Published var isFavourite: Bool = false
    
    func loadFavorite(_ item: LocationItem) {
        self.isFavourite = self.dataManager.isFavorite(item)
    }
    
    func detailWeather(_ item: LocationItem) {
        
        let id = "\(Constants.Network.idKey)\(item.id)"
        
        let params: [String: String] = [Constants.Network.keyName: Constants.Network.apiKey,
                                        Constants.Network.queryName: id,
                                        Constants.Network.dayName: Constants.Network.dayValue]
        
        let request = APIRequestBuilder(urlApi: Constants.Network.urlBase)
            .withEndPoint(Constants.Network.endPointWeather)
            .withParams(params)
            .build()
        
        self.apiManager.fetchData(request: request, type: DetailItem.self)
            .receive(on: DispatchQueue.main)
            .sink {
                if case .failure(let error) = $0 {
                    print(error)
                }
            } receiveValue: { [weak self] detail in
                self?.prepareInformation(detail)
            }.store(in: &self.cancellables)
    }
    
    private func prepareInformation(_ detail: DetailItem) {
        
    }
    
    func toogleFavourite(_ item: LocationItem) {
        if self.isFavourite {
            self.dataManager.remove(item)
        } else {
            self.dataManager.add(item)
        }
        self.isFavourite.toggle()
    }
    
}
