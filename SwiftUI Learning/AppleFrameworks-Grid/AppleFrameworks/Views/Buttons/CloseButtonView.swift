//
//  CloseButtonView.swift
//  AppleFrameworks
//
//  Created by Sarunyu Prasert on 30/3/2568 BE.
//

import SwiftUI

struct CloseButtonView: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                isShowing = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }
        .padding()
    }
}

#Preview {
    CloseButtonView(isShowing: .constant(false))
}
