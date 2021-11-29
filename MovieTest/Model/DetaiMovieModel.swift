//
//  DetaiMovie.swift
//  MovieTest
//
//  Created by Miguel Angel Requena on 28-11-21.
//

import Foundation

struct DetailMovieResponse: Codable {
    var adult: Bool
    var backdropPath: String
    var budget: Int
    var genres: [Genre]
    var homepage: String
    var id: Int
    var imdbID, originalLanguage, originalTitle, overview: String
    var popularity: Double
    var posterPath: String
    var productionCompanies: [ProductionCompany]
    var productionCountries: [ProductionCountry]
    var releaseDate: String
    var revenue, runtime: Int
    var spokenLanguages: [SpokenLanguage]
    var status, tagline, title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue, runtime
        case spokenLanguages = "spoken_languages"
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(){
        self.adult = false
        self.backdropPath = ""
        self.budget = 0
        self.genres = [Genre]()
        self.homepage = ""
        self.id = 0
        self.imdbID  = ""
        self.originalLanguage  = ""
        self.originalTitle = ""
        self.overview = ""
        self.popularity = 0
        self.posterPath = ""
        self.productionCompanies = [ProductionCompany]()
        self.productionCountries = [ProductionCountry]()
        self.releaseDate = ""
        self.revenue   = 0
        self.runtime = 0
        self.spokenLanguages = [SpokenLanguage]()
        self.status  = ""
        self.tagline = ""
        self.title = ""
        self.video = false
        self.voteAverage = 0
        self.voteCount = 0
    }
}


// MARK: - Genre
struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable, Identifiable {
    var id: Int
    var logoPath, name, originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
    init(){
        self.id = 0
        self.logoPath = ""
        self.name = ""
        self.originCountry = ""
    }

}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    let iso3166_1, name: String

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName, iso639_1, name: String

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}

