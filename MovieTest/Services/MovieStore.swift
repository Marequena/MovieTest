//
//  MovieStore.swift
//  MovieTest
//
//  Created by Miguel Angel Requena on 27-11-21.
//

import Foundation

class MovieStore {

    
    
    static let shared = MovieStore()
    init() {}
    private let apiKey = "9df01f468208a52433831209547334eb"
    private let baseAPIURL = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    
    
    func getListMovie(cat: catMovie, completion :@escaping(MoviesResponse)->()){
        guard var urlComponents = URLComponents(string: "\(baseAPIURL)/movie/\(cat.rawValue)") else {
            return
        }
        
        let queryItems = [URLQueryItem(name: "api_key", value: apiKey)]

        urlComponents.queryItems = queryItems
                
        guard let url = urlComponents.url else {
            fatalError("Error de Api Url")
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let datos = data, error == nil, let respuesta = response as? HTTPURLResponse  else {
                return
            }
            if respuesta.statusCode == 200 {
                do {
                    _ = try? JSONSerialization.jsonObject(with: datos, options: [])
                    let movies  = try JSONDecoder().decode(MoviesResponse.self, from: datos)
                    

                    DispatchQueue.main.async {
                        completion(movies)
                    }
                    
                } catch let error {
                    print("Error JSONDECODE \(error)")
                }
            }
            
        }.resume()
    }
   
    
    
    func getMovie(mov: String, completion :@escaping(DetailMovieResponse)->()){
        guard var urlComponents = URLComponents(string: "\(baseAPIURL)/movie/\(mov)") else {
            return
        }
        
        let queryItems = [URLQueryItem(name: "api_key", value: apiKey)]

        urlComponents.queryItems = queryItems
                
        guard let url = urlComponents.url else {
            fatalError("Error de Api Url")
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let datos = data, error == nil, let respuesta = response as? HTTPURLResponse  else {
                return
            }
            if respuesta.statusCode == 200 {
                do {
                    _ = try? JSONSerialization.jsonObject(with: datos, options: [])
                    let movie  = try JSONDecoder().decode(DetailMovieResponse.self, from: datos)
                    

                    DispatchQueue.main.async {
                        completion(movie)
                    }
                    
                } catch let error {
                    print("Error JSONDECODE \(error)")
                }
            }
            
        }.resume()
    }
    
    
    func getMovieVideo(mov: String, completion :@escaping(MovieVideoResponse)->()){
        guard var urlComponents = URLComponents(string: "\(baseAPIURL)/movie/\(mov)/videos") else {
            return
        }
        
        let queryItems = [URLQueryItem(name: "api_key", value: apiKey)]

        urlComponents.queryItems = queryItems
                
        guard let url = urlComponents.url else {
            fatalError("Error de Api Url")
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let datos = data, error == nil, let respuesta = response as? HTTPURLResponse  else {
                return
            }
            if respuesta.statusCode == 200 {
                do {
                    _ = try? JSONSerialization.jsonObject(with: datos, options: [])
                    let movieVideos  = try JSONDecoder().decode(MovieVideoResponse.self, from: datos)
                    

                    DispatchQueue.main.async {
                        completion(movieVideos)
                    }
                    
                } catch let error {
                    print("Error JSONDECODE \(error)")
                }
            }
            
        }.resume()
    }
    
    
    private func handleError(errorHandler: @escaping(_ error: Error) -> Void, error: Error) {
        DispatchQueue.main.async {
            errorHandler(error)
        }
    }
    
}
