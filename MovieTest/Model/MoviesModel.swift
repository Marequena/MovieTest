//
//  Comments.swift
//  MovieTest
//
//  Created by Miguel Angel Requena on 27-11-21.
//

import Foundation


struct MoviesResponse: Codable {
    var results: [Movie]
    var totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    init(){
        self.results = [Movie()]
        self.totalPages = 0
        self.totalResults = 0
    }
}


// MARK: - Result
struct Movie: Codable, Identifiable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, title: String
    let releaseDate: String?
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(){
        self.adult  = false
        self.backdropPath = ""
        self.genreIDS = []
        self.id = 0
        self.originalTitle = ""
        self.overview = ""
        self.popularity  =  0
        self.posterPath = ""
        self.releaseDate = ""
        self.title = ""
        self.video = false
        self.voteAverage = 0
        self.voteCount = 0

    }
}

enum catMovie: String, Codable {
    case upcoming
    case popular
    case topRated = "top_rated"
}
