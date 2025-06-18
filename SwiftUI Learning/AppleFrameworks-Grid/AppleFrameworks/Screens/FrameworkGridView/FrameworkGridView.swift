//
//  FrameworkGridView.swift
//  AppleFrameworks
//
//  Created by Sarunyu Prasert on 28/3/2568 BE.
//

import SwiftUI

struct FrameworkGridView: View {
    
    // Use state object when create a new one on that view
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        // For iOS 16 is minimum
        // Data-Driven Navigation API
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    // No need id: because it conform to identifiable
                    ForEach(MockData.frameworks) { framework in
                        NavigationLink(value: framework) {
                            FrameworkTitleView(framework: framework)
                        }
                        
                    }
                }
                
            }
            .navigationTitle("🍎Frameworks")
            .navigationDestination(for: Framework.self) { framework in
                FrameworkDetailView(framework: framework)
            }
        }
        
    }
}
    
#Preview {
        FrameworkGridView()
}


