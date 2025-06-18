//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Sarunyu Prasert on 21/5/2568 BE.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    let screenSize = UIScreen.main.bounds.size
    
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(height: 225)
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
            
            VStack(spacing: 16) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding(.horizontal)
                
                HStack(spacing: 40) {
                    NutritionsInfo(title: "Calories", value: "\(appetizer.calories) g")
                    NutritionsInfo(title: "Carbs", value: "\(appetizer.carbs) g")
                    NutritionsInfo(title: "Protein", value: "\(appetizer.protein) g")
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowingDetail = false
            } label: {
//               APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to order")
                Text("$\(appetizer.price, specifier: "%.2f") - Add to order")
                    .fontWeight(.semibold)
            }
//            .buttonStyle(.bordered)
//            .tint(.brandPrimary)
//            .controlSize(.large)
            .modifier(StandardButtonStyle())
            .padding(.bottom, 20)
            
        }
        .frame(width: screenSize.width * 0.8,
               height: screenSize.height * 0.6)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingDetail = false
            } label: {
                xDismissButton()
            }

        }
    }
}

struct NutritionsInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text(value)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer,
                        isShowingDetail: .constant(true))
}
