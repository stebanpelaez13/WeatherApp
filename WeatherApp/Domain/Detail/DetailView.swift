//
//  DetailView.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import SwiftUI

struct DetailView: View {
    
    let item: LocationItem
    
    @StateObject var viewModel: DetailViewModel = DetailViewModel()
    
    var body: some View {
        Text(item.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: self.viewModel.isFavourite ? Constants.Images.startFill : Constants.Images.start)
                        .onTapGesture {
                            withAnimation {
                                self.viewModel.toogleFavourite(self.item)
                            }
                        }
                }
            }.task {
                self.viewModel.loadFavorite(self.item)
                self.viewModel.detailWeather(self.item)
            }
    }

}

#Preview {
    let viewModel = DetailViewModel(apiManager: MockApiManager.shared, dataManager: MockDataManager.shared)
    
    let view = DetailView(item: MockHelper.mockLocation, viewModel: viewModel)
    
    if #available(iOS 16.0, *) {
        NavigationStack {
            view
        }
    } else {
        NavigationView {
            view
        }
    }
}
