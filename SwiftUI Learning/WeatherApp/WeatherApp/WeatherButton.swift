//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Sarunyu Prasert on 28/3/2568 BE.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .medium))
            .cornerRadius(10)
    }
}

#Preview {
    WeatherButton(title: "Test Button", textColor: .white, backgroundColor: .blue)
}
