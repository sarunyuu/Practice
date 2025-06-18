//
//  CircleImage.swift
//  Landmarks
//
//  Created by Sarunyu Prasert on 23/1/2568 BE.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image(.chincoteague))
}
