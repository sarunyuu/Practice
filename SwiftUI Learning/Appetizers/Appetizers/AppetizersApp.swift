//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Sarunyu Prasert on 13/4/2568 BE.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    // Environment object to use in child view
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
