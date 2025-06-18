//
//  Profile.swift
//  Landmarks
//
//  Created by Sarunyu Prasert on 11/2/2568 BE.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "Boy")
    
    enum Season: String, CaseIterable, Identifiable {
        var id: String { rawValue }

        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
    
    
    
}
