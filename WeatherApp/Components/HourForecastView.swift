//
//  HourForecastView.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 7/01/25.
//
import SwiftUI

struct HourForecastView: View {
    
    let temp: String
    let icon: Image?
    let porc: String
    let time: String
    
    var body: some View {
        VStack {
            Text("\(self.temp)º")
                .font(.caption)
                .fontWeight(.medium)
            Spacer()
            self.icon?
                .renderingMode(.original)
                .imageScale(.large)
            Text("\(self.porc)%")
                .font(.caption)
                .foregroundColor(.blueColor)
            Spacer()
            Text(self.time)
                .font(.caption)
                .fontWeight(.medium)
        }
        .frame(width: 48, height: 108)
        .padding(10)
        .background(Color.graySmoke)
        .cornerRadius(10)
    }
}

#Preview {
    HourForecastView(temp: "19", icon: .cloudSnow, porc: "20", time: "12 AM")
}
