//
//  Image+Extension.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import SwiftUI

extension Image {
    
    
    static let sunMax = Image(systemName: "sun.max")
    static let humidity = Image(systemName: "humidity")
    static let sunrise = Image(systemName: "sunrise")
    static let sunset = Image(systemName: "sunset")
    static let wind = Image(systemName: "wind")
    static let windDir = Image(systemName: "arrow.up.right.circle")
    static let cloudSnow = Image(systemName: "cloud.snow.fill")
    
    internal static func weatherCodeToImage(code: Int, isNight: Bool = false) -> Image? {
        switch code {
            case 1282:
                return Image(systemName: "cloud.snow.fill")
            case 1279:
                return isNight ? Image(systemName: "cloud.moon.bolt.fill") : Image(systemName: "cloud.sun.bolt.fill")
            case 1276:
                return Image(systemName: "cloud.bolt.fill")
            case 1273:
                return isNight ? Image(systemName: "cloud.moon.bolt.fill") : Image(systemName: "cloud.sun.bolt.fill")
            case 1264:
                return Image(systemName: "cloud.sleet.fill")
            case 1261:
                return Image(systemName: "cloud.sleet.fill")
            case 1258:
                return Image(systemName: "cloud.snow.fill")
            case 1255:
                return Image(systemName: "cloud.heavyrain.fill")
            case 1252:
                return isNight ? Image(systemName: "cloud.moon.rain.fill") : Image(systemName: "cloud.sun.rain.fill")
            case 1249:
                return isNight ? Image(systemName: "cloud.moon.rain.fill") : Image(systemName: "cloud.sun.rain.fill")
            case 1246:
                return Image(systemName: "cloud.heavyrain.fill")
            case 1243:
                return isNight ? Image(systemName: "cloud.moon.rain.fill") : Image(systemName: "cloud.sun.rain.fill")
            case 1240:
                return isNight ? Image(systemName: "cloud.moon.rain.fill") : Image(systemName: "cloud.sun.rain.fill")
            case 1237:
                return Image(systemName: "cloud.sleet.fill")
            case 1225:
                return Image(systemName: "cloud.snow.fill")
            case 1222:
                return Image(systemName: "cloud.snow.fill")
            case 1219:
                return Image(systemName: "cloud.snow.fill")
            case 1216:
                return Image(systemName: "cloud.snow.fill")
            case 1213:
                return Image(systemName: "cloud.snow.fill")
            case 1210:
                return Image(systemName: "cloud.snow.fill")
            case 1207:
                return Image(systemName: "cloud.snow.fill")
            case 1204:
                return Image(systemName: "cloud.sleet.fill")
            case 1201:
                return Image(systemName: "cloud.sleet.fill")
            case 1198:
                return Image(systemName: "cloud.sleet.fill")
            case 1195:
                return Image(systemName: "cloud.sleet.fill")
            case 1192:
                return Image(systemName: "cloud.heavyrain.fill")
            case 1189:
                return Image(systemName: "cloud.heavyrain.fill")
            case 1186:
                return isNight ? Image(systemName: "cloud.moon.rain.fill") : Image(systemName: "cloud.sun.rain.fill")
            case 1183:
                return Image(systemName: "cloud.drizzle.fill")
            case 1180:
                return Image(systemName: "cloud.drizzle.fill")
            case 1171:
                return Image(systemName: "cloud.sleet.fill")
            case 1168:
                return Image(systemName: "cloud.sleet.fill")
            case 1153:
                return Image(systemName: "cloud.drizzle.fill")
            case 1150:
                return isNight ? Image(systemName: "cloud.moon.rain.fill") : Image(systemName: "cloud.sun.rain.fill")
            case 1147:
                return Image(systemName: "cloud.fog.fill")
            case 1135:
                return Image(systemName: "cloud.fog.fill")
            case 1117:
                return Image(systemName: "cloud.snow.fill")
            case 1114:
                return Image(systemName: "cloud.hail.fill")
            case 1087:
                return isNight ? Image(systemName: "cloud.moon.bolt.fill") : Image(systemName: "cloud.sun.bolt.fill")
            case 1072:
                return Image(systemName: "cloud.sleet.fill")
            case 1069:
                return Image(systemName: "cloud.sleet.fill")
            case 1066:
                return isNight ? Image(systemName: "cloud.moon.rain.fill") : Image(systemName: "cloud.sun.rain.fill")
            case 1063:
                return isNight ? Image(systemName: "cloud.moon.rain.fill") : Image(systemName: "cloud.sun.rain.fill")
            case 1030:
                return Image(systemName: "cloud.fog.fill")
            case 1009:
                return Image(systemName: "cloud.fill")
            case 1006:
                return Image(systemName: "cloud.fill")
            case 1003:
                return isNight ? Image(systemName: "cloud.fill") : Image(systemName: "cloud.sun.fill")
            case 1000:
                return isNight ? Image(systemName: "moon.circle.fill") : Image(systemName: "sun.max.fill")
            default:
                return nil
        }
    }
    
}
