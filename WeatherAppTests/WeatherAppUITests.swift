//
//  WeatherAppUITests.swift
//  WeatherAppTests
//
//  Created by Juan Esteban Pelaez on 3/01/25.
//

import XCTest
import ViewInspector
import SwiftUI

@testable import WeatherApp

extension Inspection: InspectionEmissary { }

final class WeatherAppUITests: XCTestCase {
    
    @MainActor
    func testSearchView() throws {
        
        let viewModel = SearchViewModel(apiManager: MockApiManager.shared, dataManager: MockDataManager.shared)
        viewModel.locations = MockHelper.listLocation
        
        let sut = SearchView(viewModel: viewModel)
        
        let exp = sut.inspection.inspect { view in
            let group = try view.implicitAnyView().group()
            let value = try group.accessibilityIdentifier()
            XCTAssertEqual(value, Constants.Identifiers.searchGroup)
        }
        
        ViewHosting.host(view: sut)
        defer { ViewHosting.expel() }
        wait(for: [exp], timeout: 1.0)
    }
    
    @MainActor
    func testFavouritesView() throws {
        
        let viewModel = FavouritesViewModel(apiManager: MockApiManager.shared, dataManager: MockDataManager.shared)
        viewModel.favourites = []
        
        let sut = FavouritesView(viewModel: viewModel)
        
        let exp = sut.inspection.inspect { view in
            let value = try view.implicitAnyView().view(LocationListView.self).accessibilityIdentifier()
            XCTAssertEqual(value, Constants.Identifiers.listGroup)
        }
        
        ViewHosting.host(view: sut.environmentObject(SearchRouter()))
        defer { ViewHosting.expel() }
        wait(for: [exp], timeout: 1.0)
    }
    
    @MainActor
    func testDetailView() throws {
        
        let viewModel = DetailViewModel(apiManager: MockApiManager.shared, dataManager: MockDataManager.shared)
        viewModel.weatherItem = MockHelper.getMockWeather()
        
        let sut = DetailView(item: MockHelper.mockLocation, viewModel: viewModel)
        
        let exp = sut.inspection.inspect { view in
            let value = try view.implicitAnyView().scrollView().vStack().group(0)
                .accessibilityIdentifier()
            XCTAssertEqual(value, Constants.Identifiers.detailCurrent)
        }
        
        ViewHosting.host(view: sut)
        defer { ViewHosting.expel() }
        wait(for: [exp], timeout: 1.0)
        
    }
    
    func testRouter() {
        
        let router = SearchRouter()
        
        let detail: SearchRouter.Router = .detail(MockHelper.mockLocation)
        router.navigateTo(detail)
        router.navigateTo(.favourites)
        
        _ = router.view(for: .favourites)
        _ = router.view(for: detail)
        
        XCTAssertEqual(router.path.last, .favourites)
        
        router.navigateBack()
        
        let last = router.path.last
        
        XCTAssertNotNil(last?.id)
        
        XCTAssertEqual(last, detail)
    }
    
}
