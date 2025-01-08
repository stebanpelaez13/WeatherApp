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
    @Published var weatherItem: WeatherItem? = nil
    
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
        
        self.apiManager.fetchData(request: request, type: WeatherItem.self)
            .receive(on: DispatchQueue.main)
            .sink {
                if case .failure(let error) = $0 {
                    print(error)
                }
            } receiveValue: { [weak self] weatherItem in
                self?.weatherItem = weatherItem
            }.store(in: &self.cancellables)
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

extension DetailViewModel {
    
    var hoursForecast: [CurrentItem] {
        guard let todayWeather = self.weatherItem?.forecast.forecastday.first?.hour else { return [] }
        let now = Calendar.current.component(.hour, from: Date())
        return todayWeather.filter {
            guard let time = $0.time, let hourlyDate = DateHelper.stringToDate(time, format: DateHelper.dateFormatTime) else { return false }
            let hourly = Calendar.current.component(.hour, from: hourlyDate)
            return hourly > now
        }
    }
    
    var daysForecast: [Forecastday] {
        return self.weatherItem?.forecast.forecastday ?? []
    }
    
    func value(_ field: FieldFormatted) -> String {
        guard let weatherItem = self.weatherItem, let currentForecast = weatherItem.forecast.forecastday.first else {
            return ""
        }
        let current = weatherItem.current
        switch field {
        case .temp:
            return "\(current.tempC)º"
        case .feels:
            return "Feels like \(current.feelslikeC)º"
        case .uv:
            return "UV: \(current.uv)"
        case .humidity:
            return "\(current.humidity)%"
        case .wind:
            return "\(current.windKph)km/h"
        case .windDir:
            return "\(current.windDir)"
        case .rangeTemp:
            return "High \(currentForecast.day.maxtempC)º · Low \(currentForecast.day.mintempC)º"
        case .cloud:
            return "\(current.cloud)%"
        case .sunrise:
            return currentForecast.astro.sunrise
        case .sunset:
            return currentForecast.astro.sunset
        case .visibility:
            return "\(current.visKM) KM"
        case .presure:
            return "\(current.pressureIn) inHg"
        case .precipitation:
            return "\(current.precipIn) in"
        }
    }
    
    func imageCurrent() -> Image? {
        guard let weatherItem = self.weatherItem else {
            return nil
        }
        let current = weatherItem.current
        return self.imageFor(code: current.condition.code)
    }
    
    func imageFor(code: Int) -> Image? {
        return Image.weatherCodeToImage(code: code)
    }
    
    func timeFor(time: String?) -> String {
        if let time = time, let value = DateHelper.timeOfDay(from: time) {
            return value
        }
        return ""
    }
    
    func dayFor(day: String) -> String {
        if let today = self.weatherItem?.current.lastUpdated?.prefix(10), today == day {
            return "Today"
        }
        return DateHelper.dayOfWeek(from: day) ?? ""
    }
    
}
