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
            .navigationViewStyle(.stack)
        }
    }
    
    @ViewBuilder func contentSearch() -> some View {
        LocationListView(emptyText: Constants.Messages.notMatches,
                         searchText: self.textObserver.debouncedText,
                         items: self.viewModel.locations)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: self.router.view(for: .favourites)) {
                    Image(systemName: Constants.Images.startFill)
                }
            }
        }
        .navigationTitle(Constants.Messages.titleSearch)
        .searchable(text: $textObserver.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: Constants.Messages.placeholder)
        .onReceive(textObserver.$debouncedText) { query in
            DispatchQueue.main.async {
                self.viewModel.searchLocations(query: query)
            }
        }
        .environmentObject(self.router)
    }
    
}

#Preview {
    let manager = MockApiManager.shared
    manager.mock = MockHelper.listLocation
    
    let viewModel = SearchViewModel(apiManager: manager)
    return SearchView(viewModel: viewModel)
}
