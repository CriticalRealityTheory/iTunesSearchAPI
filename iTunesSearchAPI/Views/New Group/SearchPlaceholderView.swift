//
//  SearchPlaceholderView.swift
//  iTunesSearchAPI
//
//  Created by David Simpson on 8/25/22.
//

import SwiftUI

struct SearchPlaceholderView: View {
    @Binding var searchTerm: String
    let suggestions = ["Rammstein", "Cry To Me", "Maneskin"]
    
    var body: some View {
        VStack(spacing: 15) {
            
            Text("Trending")
                .font(.title)
            ForEach(suggestions, id: \.self) { text in
                Button {
                    searchTerm = text
                } label: {
                    Text(text)
                        .font(.title2)
                }
            }
        }
    }
}

struct SearchPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlaceholderView(searchTerm: .constant("John"))
    }
}


