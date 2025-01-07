//
//  DayForecastView.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 7/01/25.
//

import SwiftUI

struct DayForecastView: View {
    
    let day: String
    let highTemp: String
    let lowTemp: String
    let icon: Image?
    
    var body: some View {
        HStack {
            Text(self.day)
                .fontWeight(.medium)
            Spacer()
            Text("\(self.highTemp) / \(self.lowTemp) ºC")
                .fontWeight(.light)
            self.icon?
                .renderingMode(.original)
                .imageScale(.large)
        }
        .frame(height: 48)
        .padding(10)
        .background(Color.graySmoke)
        .cornerRadius(10)
    }
}

#Preview {
    DayForecastView(day: "Monday", highTemp: "19", lowTemp: "20", icon: .cloudSnow)
        .padding()
}
