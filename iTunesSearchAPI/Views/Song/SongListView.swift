//
//  SongListView.swift
//  iTunesSearchAPI
//
//  Created by David Simpson on 8/25/22.
//

import SwiftUI

struct SongListView: View {
    @ObservedObject var viewModel = SongListViewModel()
    
    var body: some View {
        
            List {
                ForEach(viewModel.songs) { song in
                    SongRowView(song: song)
                }
                
                switch viewModel.state {
                    case .good:
                        Color.clear
                        .onAppear {
                            viewModel.loadMore()
                        }
                    case .isLoading:
                        ProgressView()
                        .progressViewStyle(.circular)
                        .frame(maxWidth: .infinity)
                    
                    case .loadedAll:
                        EmptyView()
                        
                    case .error(let message):
                        Text(message)
                        .foregroundColor(.pink)
                    
                }
            }
            .listStyle(.plain)
        
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(viewModel: SongListViewModel.example())
    }
}


