//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Sarunyu Prasert on 20/5/2568 BE.
//

import SwiftUI

@MainActor final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        Task {
            do {
                let uiimage = try await NetworkManager.shared.downloadImage(urlString: urlString)
                image = Image(uiImage: uiimage)
            } catch {
                if let apError = error as? APError {
                    debugPrint(apError.localizedDescription)
                }
            }
        }
    }
    
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
    }
}
