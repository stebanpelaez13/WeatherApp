//
//  OtherSummaryView.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 7/01/25.
//
import SwiftUI

struct OtherSummaryView: View {
    
    let title, detail: String
    
    var body: some View {
        HStack {
            Text(self.title)
            Spacer()
            Text(self.detail)
        }
    }
}

#Preview {
    OtherSummaryView(title: Constants.Messages.visibility, detail: "10 KM")
}
