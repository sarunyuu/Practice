//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Sarunyu Prasert on 11/2/2568 BE.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }
            .padding(.horizontal)
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
                    .padding(.horizontal)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear() {
                        draftProfile = modelData.profile
                    }
                    .onDisappear() {
                        modelData.profile = draftProfile
                    }
            }
            
        }
        //padding()
    }
        
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
