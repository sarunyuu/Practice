//
//  ContentView.swift
//  NetworkingTutorial
//
//  Created by Sarunyu Prasert on 14/2/2568 BE.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = CoinViewModel()
    
    var body: some View {
        List(viewModel.coins) { coin in
            HStack {
                Text("\(coin.marketCapRank)")
                    .foregroundStyle(.gray)
                VStack(alignment: .leading, spacing: 4) {
                    Text(coin.name)
                        .fontWeight(.semibold)
                    Text(coin.symbol.uppercased())
                }
            }
            .font(.footnote)
        }
        .overlay {
            if let error = viewModel.errMsg {
                Text(error)
             }
        }
    }
}

#Preview {
    ContentView()
}
