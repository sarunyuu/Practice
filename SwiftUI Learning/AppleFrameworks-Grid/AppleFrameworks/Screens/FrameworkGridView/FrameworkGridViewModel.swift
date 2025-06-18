//
//  FrameworkGridViewModel.swift
//  AppleFrameworks
//
//  Created by Sarunyu Prasert on 30/3/2568 BE.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
}

