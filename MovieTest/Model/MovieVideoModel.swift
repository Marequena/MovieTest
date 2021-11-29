//
//  MovieVideoModel.swift
//  MovieTest
//
//  Created by Miguel Angel Requena on 28-11-21.
//

import Foundation

struct MovieVideoResponse: Codable, Identifiable {
    var id: Int
    var results: [Video]
    
    enum CodingKeys: String, CodingKey {
        case id
        case results
    }
    
    init(){
        self.id = 0
        self.results = [Video]()
    }
        
        
}

// MARK: - Result
struct Video: Codable, Identifiable {
    var id: String?
    var key: String
    var name, site: String
    var type: String
    

    enum CodingKeys: String, CodingKey {
        case id
        case key, name, site, type
    }
    
    init(){
        self.id = "0"
        self.key = ""
        self.name = ""
        self.site = ""
        self.type = ""
    }
}
