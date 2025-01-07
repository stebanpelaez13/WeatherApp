//
//  SplashView.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 1/01/25.
//

import SwiftUI
import SwiftData

struct SplashView: View {
    
    let duration: Int
    
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blueColor, .redColor]),
                           startPoint: .leading, endPoint: .trailing)
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text(Constants.Messages.titleSplash)
                    .font(.largeTitle)
                    .bold()
                Image(systemName: Constants.Images.sun)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .rotationEffect(.degrees(self.isAnimating ? 360 : 0))
                    .animation(Animation.linear(duration: TimeInterval(self.duration/2)).repeatForever(autoreverses: false), value: self.isAnimating)
            }
            HStack(spacing: 12) {
                ForEach(0..<self.duration, id: \.self) { index in
                    DropView(duration: index, isAnimating: self.isAnimating)
                }
            }
        }
        .foregroundColor(.white)
        .onAppear {
            self.isAnimating = true
        }
        .onDisappear {
            self.isAnimating = false
        }
    }
    
}

struct DropView: View {
    
    let duration: Int
    let isAnimating: Bool
    
    var body: some View {
        let size = UIScreen.main.bounds.height/2
        Image(systemName: Constants.Images.drop)
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
            .offset(y: self.isAnimating ? size-(size/3) : -size)
            .animation(.easeInOut(duration: TimeInterval(self.duration)), value: self.isAnimating)
    }
    
}

#Preview {
    return SplashView(duration: 4)
}
