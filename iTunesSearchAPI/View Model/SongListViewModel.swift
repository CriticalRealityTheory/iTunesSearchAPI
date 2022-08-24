//
//  SongListViewModel.swift
//  iTunesSearchAPI
//
//  Created by David Simpson on 8/20/22.
//

import Foundation
import Combine

class SongListViewModel: ObservableObject {
    
    @Published var songs: [Song] = [Song]()
    @Published var searchTerm: String = ""
    @Published var state: FetchState = .good
    
    private let service = APIService()
    
    var subscriptions = Set<AnyCancellable>()
    
    let limit: Int = 20
    var page: Int = 0
    
    init() {
        
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                self?.state = .good
                self?.songs = []
                self?.fetchSongs(for: term)
        }.store(in: &subscriptions)
        
    }
    
    
    func loadMore() {
        fetchSongs(for: searchTerm)
    }
    
    func fetchSongs(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        guard state == FetchState.good else {
            return
        }
        
        state = .isLoading
        
        service.fetchSongs(searchTerm: searchTerm, page: page, limit: limit) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let results):
                        for song in results.results {
                            self?.songs.append(song)
                        }
                        self?.page += 1
                        self?.state = (results.results.count == self?.limit) ? .good : .loadedAll
                        print("fetched \(results.resultCount)")
                    case .failure(let error):
                        self?.state = .error("Could not load: \(error.localizedDescription)")
                }
            }
        }
    }
    
}
