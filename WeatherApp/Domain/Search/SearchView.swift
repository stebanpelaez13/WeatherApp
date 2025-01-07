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
        Group {
            if #available(iOS 16.0, *) {
                NavigationStack(path: $router.path) {
                    self.contentList
                        .navigationDestination(for: SearchRouter.Router.self) { route in
                            self.router.view(for: route)
                        }
                }
            } else {
                NavigationView {
                    self.contentList
                }
                .navigationViewStyle(.stack)
            }
        }
        .environmentObject(self.router)
    }
    
    private var contentList: some View {
        LocationListView(emptyText: Constants.Messages.notMatches,
                         searchText: self.textObserver.debouncedText,
                         items: self.viewModel.locations)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                self.favouriteItem()
            }
        }
        .navigationTitle(Constants.Messages.titleSearch)
        .searchable(text: $textObserver.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: Constants.Messages.placeholder)
        .onReceive(textObserver.$debouncedText) { query in
            DispatchQueue.main.async {
                self.viewModel.searchLocations(query: query)
            }
        }
    }
    
    @ViewBuilder private func favouriteItem() -> some View {
        let image = Image(systemName: Constants.Images.startFill)
        if #available(iOS 16.0, *) {
            image.onTapGesture {
                self.router.navigateTo(.favourites)
            }
        } else {
            NavigationLink(destination: self.router.view(for: .favourites)) {
                image
            }
        }
    }
    
}

#Preview {
    let manager = MockApiManager.shared
    manager.mock = MockHelper.listLocation
    
    let viewModel = SearchViewModel(apiManager: manager, dataManager: MockDataManager.shared)
    return SearchView(viewModel: viewModel)
}
