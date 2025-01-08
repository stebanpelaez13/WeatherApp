//
//  WeatherItem.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import Foundation

// MARK: - WeatherItem
struct WeatherItem: Codable {
    let current: CurrentItem
    let forecast: Forecast
}

// MARK: - Current
struct CurrentItem: Codable, Identifiable {
    let id = UUID()
    let lastUpdated: String?
    let tempC: Double
    //let tempF: Double
    //let windMph: Double
    let windKph: Double
    //let windDegree: Int
    let windDir: String
    let pressureIn: Double
    let precipIn: Double
    //let pressureMB, precipMm: Double
    let humidity, cloud: Int
    let feelslikeC: Double
    //let feelslikeF, windchillC, windchillF: Double
    //let heatindexC, heatindexF, dewpointC, dewpointF: Double
    let visKM: Double
    //let visMiles: Double
    let uv: Double
    //let gustMph, gustKph: Double
    let time: String?
    let condition: Condition
    
    enum CodingKeys: String, CodingKey {
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        //case tempF = "temp_f"
        //case windMph = "wind_mph"
        case windKph = "wind_kph"
        //case windDegree = "wind_degree"
        case windDir = "wind_dir"
        //case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        //case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        //case feelslikeF = "feelslike_f"
        //case windchillC = "windchill_c"
        //case windchillF = "windchill_f"
        //case heatindexC = "heatindex_c"
        //case heatindexF = "heatindex_f"
        //case dewpointC = "dewpoint_c"
        //case dewpointF = "dewpoint_f"
        case visKM = "vis_km"
        //case visMiles = "vis_miles"
        case uv
        //case gustMph = "gust_mph"
        //case gustKph = "gust_kph"
        case time, condition
    }
}

struct Condition: Codable {
    let text: String
    let code: Int
}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]
}

// MARK: - Forecastday
struct Forecastday: Codable, Identifiable {
    let id = UUID()
    let date: String
    let day: Day
    let astro: Astro
    let hour: [CurrentItem]
    
    enum CodingKeys: String, CodingKey {
        case date, day, astro, hour
    }
}

struct Astro: Codable {
    let sunrise: String
    let sunset: String
}

// MARK: - Day
struct Day: Codable {
    let maxtempC: Double
    //let maxtempF: Double
    let mintempC: Double
    //let mintempF: Double
    let avgtempC: Double
    //let avgtempF: Double
    //let maxwindMph: Double
    let maxwindKph: Double
    //let totalprecipMm: Double
    //let totalprecipIn: Double
    //let totalsnowCM: Double
    let avgvisKM: Double
    //let avgvisMiles: Double
    let avghumidity: Int
    let condition: Condition
    
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        //case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        //case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        //case avgtempF = "avgtemp_f"
        //case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        //case totalprecipMm = "totalprecip_mm"
        //case totalprecipIn = "totalprecip_in"
        //case totalsnowCM = "totalsnow_cm"
        case avgvisKM = "avgvis_km"
        //case avgvisMiles = "avgvis_miles"
        case avghumidity, condition
    }
    
}
