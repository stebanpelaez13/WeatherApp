//
//  FavouritesView.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import SwiftUI

struct FavouritesView: View {
    
    @StateObject var viewModel: FavouritesViewModel = FavouritesViewModel()
    
    internal let inspection = Inspection<Self>()

    var body: some View {
        LocationListView(emptyText: Constants.Messages.notFovourites, searchText: "", items: self.viewModel.favourites)
            .navigationTitle(Constants.Messages.titleFavourites)
            .task {
                self.viewModel.fetchFavourites()
            }
            .accessibilityIdentifier(Constants.Identifiers.listGroup)
            .onReceive(inspection.notice) { self.inspection.visit(self, $0) }
    }
}

#Preview {
    
    let viewModel = FavouritesViewModel(apiManager: MockApiManager.shared, dataManager: MockDataManager.shared)
    
    FavouritesView(viewModel: viewModel)
        .environmentObject(SearchRouter())
}
