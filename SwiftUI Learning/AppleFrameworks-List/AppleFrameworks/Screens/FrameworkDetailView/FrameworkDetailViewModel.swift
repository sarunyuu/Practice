//
//  FrameworkDetailViewModel.swift
//  AppleFrameworks
//
//  Created by Sarunyu Prasert on 4/6/2568 BE.
//

import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    
    let framework: Framework
    var isShowingDetailView: Binding<Bool>
    @State var isShowingSafariView = false
        
    init(framework: Framework, isShowingDetailView: Binding<Bool>) {
        self.framework = framework
        self.isShowingDetailView = isShowingDetailView
    }
}

