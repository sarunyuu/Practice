//
//  FrameworkDetailView.swift
//  AppleFrameworks
//
//  Created by Sarunyu Prasert on 29/3/2568 BE.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @ObservedObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        VStack {
            
            Spacer()
            
            FrameworkTitleView(framework: viewModel.framework)
            
            Text(viewModel.framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Link(destination: URL(string: viewModel.framework.urlString) ?? URL(string: "www.apple.com")!) {
                Label("Learn More", systemImage: "book.fill")
//                    .foregroundStyle(Color.label)
            }
            
            
//            Button {
//                viewModel.isShowingSafariView = true
//            } label: {
//                //FrameworkButton(title: "Learn More")
//                Label("Learn More", systemImage: "book.fill")
//            }
//            .buttonStyle(.bordered)
//            .buttonBorderShape(.capsule)
//            .border(.red, width: 2)
//            .controlSize(.large)
//            .tint(.red)
            
        }
        .fullScreenCover(isPresented: $viewModel.isShowingSafariView) {
            SafariView(url: URL(string: viewModel.framework.urlString) ?? URL(string: "www.apple.com")!)
        }
    }
}

#Preview {
    FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: MockData.sampleFramework, isShowingDetailView: .constant(false)))
}


