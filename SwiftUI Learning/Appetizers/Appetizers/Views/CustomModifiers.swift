//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Sarunyu Prasert on 28/5/2568 BE.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
    
}
