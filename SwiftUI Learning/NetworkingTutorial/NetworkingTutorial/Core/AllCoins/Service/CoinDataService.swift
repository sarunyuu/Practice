//
//  CoinDataService.swift
//  NetworkingTutorial
//
//  Created by Sarunyu Prasert on 14/2/2568 BE.
//

import Foundation

class CoinDataService {
    
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=24h&locale=en"
    
    func fetchCoins() async throws -> [Coin] {
        guard let url = URL(string: urlString) else { return [] }
        
        do {
            let (data,response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw CoinAPIError.requestFail(description: "Request failed")
            }
            guard httpResponse.statusCode == 200 else {
                throw CoinAPIError.invalidStatusCode(statusCode: httpResponse.statusCode)
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let coins = try decoder.decode([Coin].self, from: data)
            return coins
        } catch {
            print("Error: \(error.localizedDescription)")
            return []
            //throw CoinAPIError.unknownError(error: error)
        }
    }
    
}

extension CoinDataService {
    func fetchCoinsWithResult(completion: @escaping (Result<[Coin], CoinAPIError>)-> Void) {
        guard let url = URL(string: urlString) else { return }
        
        //        var request = URLRequest(url: url)
        //        request.httpMethod = "GET"
        //        request.timeoutInterval = 10
        //        request.allHTTPHeaderFields = [
        //            "accept": "application/json",
        //            "x-cg-pro-api-key": "CG-Zu6Q3DGPcQFnvHH3vb4nykch"
        //        ]
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.unknownError(error: error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFail(description: "Request failed")))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let coins = try decoder.decode([Coin].self, from: data)
                completion(.success(coins))
            } catch {
                print("Parsing Error: \(error.localizedDescription)")
                completion(.failure(.jsonParsingFailure))
            }
        }
    }
}
