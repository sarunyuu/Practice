//
//  ContentView.swift
//  WeatherApp
//
//  Created by Sarunyu Prasert on 27/3/2568 BE.
//

import SwiftUI

struct ContentView: View {
    
    // Let struct can hold state
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: $isNight)
            
            VStack {
                
                CityTextView(cityName: "Cupertino, CA")
                
                CurrentWeatherView(imageName: isNight ?  "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                    .padding(.bottom, 40)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "wind", temperature: 55)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.bolt.fill", temperature: 30)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 88)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.snow.fill", temperature: 20)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.rain.fill", temperature: 74)
                }
                
                Spacer()
                
                Button {
                    print("Tapped")
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: isNight ? .black : .blue,
                                  backgroundColor: isNight ? .gray : .white)
                }

                Spacer()
                
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    
    // To let isNight to be the same as isNight above
    @Binding var isNight: Bool
    
    var body: some View {
//        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : .lightBlue],
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}


struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundStyle(.white)
            .padding()
    }
}

struct CurrentWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}
