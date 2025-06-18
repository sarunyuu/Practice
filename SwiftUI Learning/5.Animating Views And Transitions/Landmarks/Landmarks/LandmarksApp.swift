//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Sarunyu Prasert on 23/1/2568 BE.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    private func loadRocketSimConnect() {
#if DEBUG
        guard Bundle(path: "/Applications/RocketSim.app/Contents/Frameworks/RocketSimConnectLinker.nocache.framework")?.load() == true else {
            print("Failed to load linker framework")
            return
        }
        print("RocketSim Connect successfully linked")
#endif
    }
    
    init() {
        loadRocketSimConnect()
    }
    
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
