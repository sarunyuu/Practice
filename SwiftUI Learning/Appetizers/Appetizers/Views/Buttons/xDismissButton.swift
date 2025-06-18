//
//  xDismissButton.swift
//  Appetizers
//
//  Created by Sarunyu Prasert on 21/5/2568 BE.
//

import SwiftUI

struct xDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(.white))
                .frame(width: 30, height: 30)
                .opacity(0.6)
                .shadow(radius: 4)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
            
            
        }
    }
}

#Preview {
    xDismissButton()
}
