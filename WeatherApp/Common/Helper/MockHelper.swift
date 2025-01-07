//
//  MockHelper.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//
import Foundation

/// Mocks para las #Previews y pruebas unitarias
enum MockHelper {
    
    static let mockLocation = LocationItem(name: "Pereira", region: "Risaralda", country: "Colombia", id: 123456, lon: 4.813, lat: -75.696)
    
    static let listLocation = [
        mockLocation,
        LocationItem(name: "Bogota", region: "Cundinamarca", country: "Colombia", id: 123457, lon: 4.6, lat: -74.8),
        LocationItem(name: "Medellin", region: "Antioquia", country: "Colombia", id: 123458, lon: 6.29, lat: -75.54),
        LocationItem(name: "New York", region: "New York", country: "United States of America", id: 123459, lon: 40.71, lat: -74.01),
        LocationItem(name: "London", region: "City of London, Greater London", country: "United Kingdom", id: 123450, lon: 51.52, lat: -0.11)
    ]
    
    static let mockCondition = Condition(text: "Light rain shower", code: 1240)
 
    static let mockAstro = Astro(sunrise: "06:13 AM", sunset: "06:05 PM")
    static let mockDay = Day(maxtempC: 22.9, mintempC: 14.6, avgtempC: 17.3, maxwindKph: 3.1, avgvisKM: 8.0, avghumidity: 91, condition: mockCondition)
    
    
    static func getMockWeather() -> WeatherItem {
        
        var forecast = [Forecastday]()
        
        let calendar = Calendar.current
        let now = Date.now
        let today = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: now)!
        
        let currentFormat = DateHelper.dateToString(now, format: DateHelper.dateFormatTime)

        let current = CurrentItem(lastUpdated: currentFormat, tempC: 15.5, windKph: 3.6, windDir: "E", humidity: 97, cloud: 66, feelslikeC: 15.9, visKM: 10, uv: 1, time: nil, condition: mockCondition)
        
        for day in 0..<3 {
            let dateDay = calendar.date(byAdding: .day, value: day, to: today)!
            var hours = [CurrentItem]()
            for hour in 0..<24 {
                let dateHour = calendar.date(byAdding: .hour, value: hour, to: today)!
                let hourFormat = DateHelper.dateToString(dateHour, format: DateHelper.dateFormatTime)
                
                hours.append(CurrentItem(lastUpdated: nil, tempC: 15.8, windKph: 2.2, windDir: "ESE", humidity: 98, cloud: 87, feelslikeC: 15.8, visKM: 10, uv: 0, time: hourFormat, condition: mockCondition))
            }
            let dayFormat = DateHelper.dateToString(dateDay, format: DateHelper.dateFormat)
            
            forecast.append(Forecastday(date: dayFormat, day: mockDay, astro: mockAstro, hour: hours))
        }
        
        return WeatherItem(current: current, forecast: Forecast(forecastday: forecast))
    }
    
}
