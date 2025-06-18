//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Sarunyu Prasert on 24/1/2568 BE.
//

import SwiftUI

struct LandmarkList: View {
    
    @State private var showFavoritesOnly: Bool = false
    
    var body: some View {
        NavigationSplitView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a landmark")
        }
        
    }
}

#Preview {
    LandmarkList()
}
