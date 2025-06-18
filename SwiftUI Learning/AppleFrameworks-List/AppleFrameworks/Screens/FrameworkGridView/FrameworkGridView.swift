//
//  FrameworkGridView.swift
//  AppleFrameworks
//
//  Created by Sarunyu Prasert on 28/3/2568 BE.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView {
            List {
                // No need id: because it conform to identifiable
                ForEach(MockData.frameworks) { framework in
                    NavigationLink {
                        FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: framework,
                                                                                isShowingDetailView: $viewModel.isShowingDetailView))
                    } label: {
                        FrameworkTitleView(framework: framework)
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
        }
        .accentColor(Color(.label))
    }
}


#Preview {
    FrameworkGridView()
}


