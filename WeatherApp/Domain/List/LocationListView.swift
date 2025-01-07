//
//  LocationListView.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import SwiftUI

struct LocationListView: View {
    
    @EnvironmentObject private var router: SearchRouter
    
    let emptyText: String
    let searchText: String
    let items: [LocationItem]
        
    var body: some View {
        ZStack {
            if self.items.isEmpty {
                Text(self.emptyText)
                    .font(.body)
            } else {
                List(self.items) { item in
                    self.contentList(item: item)
                }
                .listStyle(PlainListStyle())
            }
        }
    }
    
    @ViewBuilder func contentList(item: LocationItem) -> some View {
        if #available(iOS 16.0, *) {
            Button(action: {
                self.router.navigateTo(.detail(item))
            }) {
                LocationItemView(item: item, searchText: self.searchText)
            }
        } else {
            NavigationLink(destination: self.router.view(for: .detail(item))) {
                LocationItemView(item: item, searchText: self.searchText)
            }
        }
    }
    
}

#Preview {
    LocationListView(emptyText: "Sin resultados", searchText: "Per", items: MockHelper.listLocation)
        .environmentObject(SearchRouter())
    
}
