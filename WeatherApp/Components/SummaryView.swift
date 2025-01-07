//
//  S.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 7/01/25.
//

import SwiftUI

struct SummaryView: View {
    
    let detail: String
    let icon: Image
    
    var body: some View {
        HStack {
            self.icon
                .foregroundColor(.redColor)
            Text(self.detail)
        }
    }
}

#Preview {
    SummaryView(detail: "19", icon: .cloudSnow)
}


