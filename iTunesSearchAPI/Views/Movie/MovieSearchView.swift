//
//  MovieSearchListView.swift
//  iTunesSearchAPI
//
//  Created by David Simpson on 8/20/22.
//

import SwiftUI

struct MovieSearchView: View {
    
    @State private var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
         
            Group {
                MovieListView(viewModel: viewModel)
            }

            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Movies")
            
        }
    }
}

struct MovieSearchListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
