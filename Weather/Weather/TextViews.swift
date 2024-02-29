//
//  TextViews.swift
//  Weather
//
//  Created by Julian Thaler on 30/09/23.
//

import Foundation
import SwiftUI

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .bold, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct mainWeatherStatusView: View {
    
    var imageName: String
    var temp: Int
    
    
    var body: some View {
        VStack (spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding()
    }
}

struct WeatherDayView: View {
    
    var day : String
    var imagename : String
    var temp : Int
    
    var body: some View {
        VStack {
            Text(day)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imagename)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}


