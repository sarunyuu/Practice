//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Sarunyu Prasert on 12/2/2568 BE.
//

import SwiftUI

struct ProfileEditor: View {
    
    // For a draft copy of profile
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
            }
            
            Toggle("Enable Notifications", isOn: $profile.prefersNotifications)
            
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            
            DatePicker(
                "Goal Date",
                selection: $profile.goalDate,
                in: dateRange,
                displayedComponents: .date
            )
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
