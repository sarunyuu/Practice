//
//  CoinViewModel.swift
//  NetworkingTutorial
//
//  Created by Sarunyu Prasert on 14/2/2568 BE.
//

import Foundation

class CoinViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var errMsg: String?
    
    private let service = CoinDataService()
    
    init() {
        fetchCoins() 
    }
    
    func fetchCoins() {
        Task { @MainActor in
            self.coins = try await service.fetchCoins()
        }
    }
    
    func fetchCoinsWithCompletion() {
        service.fetchCoinsWithResult { [weak self] result in
            Task { @MainActor in
                switch result {
                case .success(let coins):
                    self?.coins = coins
                case .failure(let error):
                    self?.errMsg = error.localizedDescription
                }
            }
        }
    }
    
}
