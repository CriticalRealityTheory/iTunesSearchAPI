//
//  BuyButton.swift
//  iTunesSearchAPI
//
//  Created by David Simpson on 8/25/22.
//

import SwiftUI

struct BuyButton: View {
    let urlString: String
    let price:  Double?
    let currency: String
    
    
    var body: some View {
        if let url =  URL(string: urlString),
            let price = price {
            Link(destination: url) {
                let formattedPrice = String(format: "%.2f", price)
                Text("\(formattedPrice) \(currency)")
                    .font(.caption)
            }
            .buttonStyle(BuyButtonStyle())
        }
    }
}

struct BuyButton_Previews: PreviewProvider {
    static var previews: some View {
        let example = Song.example()
        
        BuyButton(urlString: example.previewURL, price: example.trackPrice, currency: example.currency)
    }
}
