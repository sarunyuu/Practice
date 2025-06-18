//
//  Appetizer.swift
//  Appetizers
//
//  Created by Sarunyu Prasert on 14/4/2568 BE.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let appetizers: [Appetizer]
    
    enum CodingKeys: String, CodingKey {
        case appetizers = "request"
    }
}

struct MockData {
    static let sampleAppetizer: Appetizer = Appetizer(id: 001,
                                                      name: "Crispy Calamari",
                                                      description: "Lightly breaded and fried calamari rings.",
                                                      price: 7.99,
                                                      imageURL: "https://example.com/calamari.jpg",
                                                      calories: 230,
                                                      protein: 12,
                                                      carbs: 8)
    
    static let appetizers: [Appetizer] = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    static let orderItem1: Appetizer = Appetizer(id: 001,
                                                 name: "Appetizer 1",
                                                 description: "Lightly breaded and fried calamari rings.",
                                                 price: 17.99,
                                                 imageURL: "https://example.com/calamari.jpg",
                                                 calories: 130,
                                                 protein: 12,
                                                 carbs: 8)
    static let orderItem2: Appetizer = Appetizer(id: 002,
                                                 name: "Appetizer 2",
                                                 description: "Lightly breaded and fried calamari rings.",
                                                 price: 40.99,
                                                 imageURL: "https://example.com/calamari.jpg",
                                                 calories: 270,
                                                 protein: 12,
                                                 carbs: 8)
    static let orderItem3: Appetizer = Appetizer(id: 003,
                                                 name: "Appetizer 3",
                                                 description: "Lightly breaded and fried calamari rings.",
                                                 price: 18.00,
                                                 imageURL: "https://example.com/calamari.jpg",
                                                 calories: 530,
                                                 protein: 12,
                                                 carbs: 8)
    
    static let orderItems: [Appetizer] = [orderItem1, orderItem2, orderItem3]
}
