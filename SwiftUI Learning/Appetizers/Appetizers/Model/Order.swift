//
//  Order.swift
//  Appetizers
//
//  Created by Sarunyu Prasert on 22/5/2568 BE.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ item: Appetizer) {
        items.append(item)
    }
    
    func deleteItems(at offset: IndexSet) {
        items.remove(atOffsets: offset)
    }
    
}

