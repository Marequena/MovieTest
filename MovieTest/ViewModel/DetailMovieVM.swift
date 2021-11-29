//
//  DetailMovieVM.swift
//  MovieTest
//
//  Created by Miguel Angel Requena on 20-06-21.
//

import Combine
import SwiftUI

class DetailMovieVM: ObservableObject {
    
    @Published var movie = DetailMovieResponse()
    @Published var movieVideos = MovieVideoResponse()
    
    init(mov : String) {
        if mov !=  "0"{
            self.loadMovie(mov: mov)
            self.loadMovieVideo(mov: mov)
        }
    }
    
    let changes = PassthroughSubject<DetailMovieVM, Never>()
    
    func loadMovie(mov :  String) {
        MovieStore().getMovie(mov: mov, completion: {
            self.movie = $0
        })
    }
    
    func loadMovieVideo(mov :  String) {
        MovieStore().getMovieVideo(mov: mov, completion: {
            self.movieVideos = $0
        })
    }
}

