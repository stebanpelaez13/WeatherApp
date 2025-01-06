//
//  DetailView.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import SwiftUI

struct DetailView: View {
    
    let item: LocationItem
    
    var body: some View {
        Text(item.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: Constants.Images.startFill)
                }
            }
    }
    
}

#Preview {
    if #available(iOS 16.0, *) {
        NavigationStack {
            DetailView(item: MockHelper.mockLocation)
        }
    } else {
        NavigationView {
            DetailView(item: MockHelper.mockLocation)
        }
    }
}
