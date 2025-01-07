//
//  LocationItemView.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import SwiftUI

struct LocationItemView: View {
        
    let item: LocationItem
    let searchText: String
    
    var body: some View {
        VStack {
            HighlightedTextView(text: self.item.name, boldText: self.searchText)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(self.item.getLocationRegion())
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.body)
                .foregroundStyle(Color.gray)
        }
    }
        
}

#Preview {
    LocationItemView(item: MockHelper.mockLocation, searchText: "Per")
        .padding()
}
