//
//  FrameworkButton.swift
//  AppleFrameworks
//
//  Created by Sarunyu Prasert on 29/3/2568 BE.
//

import SwiftUI

struct FrameworkButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

#Preview {
    FrameworkButton(title: "Learn more")
}
