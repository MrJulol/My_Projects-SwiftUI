//
//  ContentView.swift
//  Weather
//
//  Created by Julian Thaler on 30/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight : isNight)
            VStack {
               CityTextView(cityName: "Cupertino, CA")
                mainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 20)
                
                
                HStack (spacing: 20){
                    WeatherDayView(day: "MON", imagename: "cloud.sun.fill", temp: 19)
                    WeatherDayView(day: "TUE", imagename: "cloud.sun.fill", temp: 20)
                    WeatherDayView(day: "WED", imagename: "cloud.sun.fill", temp: 21)
                    WeatherDayView(day: "THU", imagename: "cloud.sun.fill", temp: 22)
                    WeatherDayView(day: "FRI", imagename: "cloud.sun.fill", temp: 23)
                    .padding()
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .white,
                                  backgroundColor: .blue)
                }
                Spacer()
            }
            

        }
    }
    
}

#Preview {
    ContentView()
}


