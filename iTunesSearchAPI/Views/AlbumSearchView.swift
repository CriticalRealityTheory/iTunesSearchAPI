//
//  AlbumSearchView.swift
//  iTunesSearchAPI
//
//  Created by David Simpson on 8/19/22.
//

import SwiftUI

struct AlbumSearchView: View {
    
    @StateObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        NavigationView {
         
            Group {
                if viewModel.searchTerm.isEmpty {
                    AlbumPlaceHolderView(searchTerm: $viewModel.searchTerm)
                } else {
                    AlbumListView(viewModel: viewModel)
                }
            }

            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Albums")
            
        }
    }
}

struct AlbumPlaceHolderView: View {
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

struct AlbumSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSearchView()
    }
}
