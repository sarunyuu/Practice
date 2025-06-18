//
//  ContentView.swift
//  Landmarks
//
//  Created by Sarunyu Prasert on 24/1/2568 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
