//
//  SearchView.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 2/01/25.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var textObserver = TextFieldObserver()
    @StateObject private var router = SearchRouter()
    
    @StateObject var viewModel: SearchViewModel = SearchViewModel()
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack(path: $router.path) {
                self.contentSearch()
                    .navigationDestination(for: SearchRouter.Router.self) { route in
                        self.router.view(for: route)
                    }
            }
        } else {
            NavigationView {
                self.contentSearch()
            }
        }
    }
    
    @ViewBuilder func contentSearch() -> some View {
        LocationListView(emptyText: Constants.Messages.notMatches,
                         searchText: self.textObserver.debouncedText,
                         items: self.viewModel.locations)
            .searchable(text: $textObserver.searchText)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: self.router.view(for: .favourites)) {
                        Image(systemName: Constants.Images.startFill)
                    }
                }
            }
            .onReceive(textObserver.$debouncedText) { query in
                
            }
    }
    
}

#Preview {
    return SearchView()
}
