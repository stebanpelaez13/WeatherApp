//
//  DetailView.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import SwiftUI
import MapKit

struct DetailView: View {
    
    let item: LocationItem
    
    @StateObject var viewModel: DetailViewModel = DetailViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                Group {
                    if self.viewModel.weatherItem != nil {
                        self.currentView
                        self.summaryView
                        self.forecastView
                    }
                }
                .transition(AnyTransition.opacity.animation(.linear(duration: 0.5)))
                self.mapView
                    .frame(height: 300)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle(self.item.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.graySmoke)
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
    
    private var currentView: some View {
        VStack(spacing: 10) {
            HStack {
                Text(self.viewModel.value(.temp))
                    .fontWeight(.semibold)
                self.viewModel.imageCurrent()?
                    .renderingMode(.original)
                    .imageScale(.small)
            }
            .font(.system(size: 54))
            Text(self.viewModel.value(.feels))
                .font(.title)
            Text(self.viewModel.value(.rangeTemp))
        }
    }
    
    private var summaryView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                SummaryView(detail: self.viewModel.value(.sunrise), icon: .sunrise)
                SummaryView(detail: self.viewModel.value(.sunset), icon: .sunset)
            }
            .frame(maxWidth: .infinity)
            VStack(alignment: .leading, spacing: 8) {
                SummaryView(detail: self.viewModel.value(.uv), icon: .sunMax)
                SummaryView(detail: self.viewModel.value(.humidity), icon: .humidity)
            }
            .frame(maxWidth: .infinity)
            VStack(alignment: .leading, spacing: 8) {
                SummaryView(detail: self.viewModel.value(.wind), icon: .wind)
                SummaryView(detail: self.viewModel.value(.windDir), icon: .windDir)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    private var forecastView: some View {
        VStack {
            Text(Constants.Messages.forecast)
                .font(.headline)
                .foregroundColor(.blueColor)
                .padding([.top, .leading])
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(self.viewModel.hoursForecast) { hour in
                        let icon = self.viewModel.imageFor(code: hour.condition.code)
                        let time = self.viewModel.timeFor(time: hour.time)
                        HourForecastView(temp: "\(hour.tempC)", icon: icon, porc: "\(hour.humidity)", time: time)
                    }
                }
            }
            .padding()
            
            ForEach(self.viewModel.daysForecast) { day in
                let icon = self.viewModel.imageFor(code: day.day.condition.code)
                let dayName = self.viewModel.dayFor(day: day.date)
                DayForecastView(day: dayName, highTemp: "\(day.day.maxtempC)", lowTemp: "\(day.day.mintempC)", icon: icon)
            }
            .padding([.horizontal])
            
            Spacer(minLength: 20)
        }
        .background(Color.grayGainsboro)
        .cornerRadius(10)
    }
    
    private var mapView: some View {
        if #available(iOS 17.0, *) {
            let coordinate = CLLocationCoordinate2D(latitude: self.item.lat, longitude: self.item.lon)
            let rect = MKMapRect(origin: MKMapPoint(coordinate),
                                 size: MKMapSize(width: 1, height: 1))
            return Map(bounds: MapCameraBounds(centerCoordinateBounds: rect,
                                               minimumDistance: 10000,
                                               maximumDistance: 20000)) {
                Marker(item.name, coordinate: coordinate)
            }
        } else {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: self.item.lat, longitude: self.item.lon),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            return Map(coordinateRegion: .constant(region))
        }
    }
    
}

#Preview {
    
    let manager = MockApiManager.shared
    manager.mock = MockHelper.getMockWeather()
    
    let viewModel = DetailViewModel(apiManager: manager, dataManager: MockDataManager.shared)
    
    let view = DetailView(item: MockHelper.mockLocation, viewModel: viewModel)
    
    if #available(iOS 16.0, *) {
        return NavigationStack {
            view
        }
    } else {
        return NavigationView {
            view
        }
    }
}
