//
//  APButton.swift
//  Appetizers
//
//  Created by Sarunyu Prasert on 21/5/2568 BE.
//

import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    let screenSize = UIScreen.main.bounds.size
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: (screenSize.width * 0.8) - 40, height: 50)
            .foregroundStyle(.white)
            .background(.brandPrimary)
            .cornerRadius(8)
    }
}

#Preview {
    APButton(title: "Button")
}
