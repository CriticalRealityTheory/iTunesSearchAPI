//
//  FetchState.swift
//  iTunesSearchAPI
//
//  Created by David Simpson on 8/20/22.
//

import Foundation

enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case error(String)
}
