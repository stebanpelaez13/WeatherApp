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
    
    internal let inspection = Inspection<Self>()
    
    var body: some View {
        ZStack {
            if self.items.isEmpty {
                Text(self.emptyText)
                    .font(.body)
            } else {
                List(self.items) { item in
                    Button(action: {
                        self.router.navigateTo(.detail(item))
                    }) {
                        LocationItemView(item: item, searchText: self.searchText)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .onReceive(inspection.notice) { self.inspection.visit(self, $0) }
    }
    
}

#Preview {
    LocationListView(emptyText: "Sin resultados", searchText: "Per", items: MockHelper.listLocation)
        .environmentObject(SearchRouter())
    
}
