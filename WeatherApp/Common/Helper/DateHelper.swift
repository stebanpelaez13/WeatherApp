//
//  DateHelper.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//
import Foundation

enum DateHelper {
    
    static let dateFormat     = "yyyy-MM-dd"
    static let dateFormatTime = "yyyy-MM-dd HH:mm"

    static func timeOfDay(from time: String) -> String? {
        
        guard let date = self.stringToDate(time, format: self.dateFormatTime) else {
            return nil
        }

        return self.dateToString(date, format: "h a")
    }

    static func dayOfWeek(from date: String) -> String? {
       
        guard let date = self.stringToDate(date, format: self.dateFormat) else {
            return nil
        }
       
        return self.dateToString(date, format: "EEEE").capitalized
    }
    
    static func dateToString(_ date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }

    static func stringToDate(_ time: String, format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: time)
    }

}
