//
//  Home.swift
//  MovieTest
//
//  Created by Miguel Angel Requena on 27-11-21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var movieDataPopular = MovieHomeDataVM(catg: catMovie.popular)
    @ObservedObject var movieDataTop = MovieHomeDataVM(catg: catMovie.topRated)
    @ObservedObject var movieDataUPC = MovieHomeDataVM(catg: catMovie.upcoming)
    var body: some View {
        VStack{
            TabView {
                HomeMoviesCatView(catName: .popular)
                    .environmentObject(movieDataPopular)
                    .tag(0)
                    .tabItem({
                        Text(catMovie.popular.rawValue.capitalized)
                        Image(systemName: "film")
                    })
                HomeMoviesCatView(catName: .topRated)
                    .environmentObject(movieDataTop)
                    .tag(1)
                    .tabItem({
                        Text(catMovie.topRated.rawValue.capitalized)
                        Image(systemName: "film")
                    })
                HomeMoviesCatView(catName: .upcoming)
                    .environmentObject(movieDataUPC)
                    .tag(1)
                    .tabItem({
                        Text(catMovie.upcoming.rawValue.capitalized)
                        Image(systemName: "film")
                    })
            }
//            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
