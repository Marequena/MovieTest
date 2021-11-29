//
//  MovieDataVM.swift
//  MovieTest
//
//  Created by Miguel Angel Requena on 27-11-21.
//

import Combine
import SwiftUI



class MovieHomeDataVM: ObservableObject {
    
    
    var movies = MoviesResponse()
    @Published var moviesFilters = MoviesResponse()
    
    @Published var searchText = ""

    var publisher: AnyCancellable?


    
    init(catg : catMovie) {
        if movies.totalResults == 0 {
            self.loadMovies(cat: catg)
        }
        self.publisher = $searchText
            .receive(on: RunLoop.main)
            .sink(receiveValue: { (str) in
                if !self.searchText.isEmpty {
                    self.moviesFilters.results = self.movies.results.filter { $0.title.contains(str) }
                } else {
                    self.moviesFilters = self.movies
                }
            })
        
    }
    
    let changes = PassthroughSubject<MovieHomeDataVM, Never>()
    
    func loadMovies(cat :  catMovie) {
        MovieStore().getListMovie(cat: cat, completion: {
            self.movies = $0
            self.moviesFilters = $0
        })
    }
}

