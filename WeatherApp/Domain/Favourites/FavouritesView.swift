//
//  FavouritesView.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import SwiftUI

struct FavouritesView: View {
    
    @StateObject var viewModel: FavouritesViewModel = FavouritesViewModel()
    
    var body: some View {
        LocationListView(emptyText: Constants.Messages.notFovourites, searchText: "", items: self.viewModel.favourites)
            .navigationTitle(Constants.Messages.titleFavourites)
    }
}

#Preview {
    FavouritesView()
        .environmentObject(SearchRouter())
}
