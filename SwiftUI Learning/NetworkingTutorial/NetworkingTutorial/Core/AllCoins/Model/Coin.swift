//
//  Coin.swift
//  NetworkingTutorial
//
//  Created by Sarunyu Prasert on 15/2/2568 BE.
//

import Foundation

struct Coin: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let marketCapRank: Int
}
