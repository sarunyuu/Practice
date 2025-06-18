//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Sarunyu Prasert on 20/5/2568 BE.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizersURL = baseURL + "appetizers"
    
    private init() {}
    
//    func getAppetizers(complete: @escaping (Result<[Appetizer],APError>) -> Void) {
//        guard let url = URL(string: appetizersURL) else {
//            complete(.failure(.invalidURL))
//            return
//        }
//        let urlRequest = URLRequest(url: url)
//        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//            if error != nil {
//                complete(.failure(.invalidResponse))
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                complete(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data else {
//                complete(.failure(.invalidData))
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                let appetizerResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                complete(.success(appetizerResponse.appetizers))
//            } catch {
//                complete(.failure(.invalidData))
//            }
//            
//        }.resume()
//    }
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizersURL) else {
            throw APError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).appetizers
        } catch {
            throw APError.invalidData
        }
    }
    
//    func downloadImage(urlString: String, complete: @escaping (UIImage?) -> Void) {
//        let cacheKey = NSString(string: urlString)
//        if let image = cache.object(forKey: cacheKey) {
//            complete(image)
//            return
//        }
//        
//        guard let url = URL(string: urlString) else {
//            complete(nil)
//            return
//        }
//        let urlRequest = URLRequest(url: url)
//        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//            guard let data = data, let image = UIImage(data: data) else {
//                complete(nil)
//                return
//            }
//            self.cache.setObject(image, forKey: cacheKey)
//            complete(image)
//            
//        }.resume()
//    }
    
    func downloadImage(urlString: String) async throws -> UIImage {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            return image
        }
        guard let url = URL(string: urlString) else {
            throw APError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let image = UIImage(data: data) else {
            throw APError.invalidResponse
        }
        self.cache.setObject(image, forKey: cacheKey)
        return image
    }
}
