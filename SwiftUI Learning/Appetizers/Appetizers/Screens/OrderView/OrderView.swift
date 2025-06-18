//
//  OrderView.swift
//  Appetizers
//
//  Created by Sarunyu Prasert on 13/4/2568 BE.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    @State private var orderItems = MockData.orderItems
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppertizersListCell(appetizer: appetizer)
                                .listRowSeparator(.hidden)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        print("Order place")
                    } label: {
//                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                            .fontWeight(.semibold)
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "Please place your order.\nThen you can enjoy your meal.")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
}

#Preview {
    OrderView()
}
