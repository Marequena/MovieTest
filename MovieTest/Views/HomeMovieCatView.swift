//
//  HomeMoviesCat.swift
//  MovieTest
//
//  Created by Miguel Angel Requena on 27-11-21.
//

import SwiftUI
import Combine

struct HomeMoviesCatView: View {
    var catName : catMovie
    @State var searchMovie = "Search..."
    @State var index = 0
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    @EnvironmentObject var movieData :MovieHomeDataVM
    var publisher: AnyCancellable?
    
    var body: some View {
        NavigationView  {
                
        ScrollView(.vertical, showsIndicators: false){
                LazyVStack{
                    //                Search
                    VStack{
                        HStack(spacing: 8) {
                            TextField("Search", text : $movieData.searchText)
                                .padding(.vertical,10)
                                .padding(.horizontal)
                                .foregroundColor(.gray)
                                .background(Color.black.opacity(0.07))
                                .cornerRadius(10)
                                .padding(.horizontal)
                                .padding(.top)
                            Image(systemName: "magnifyingglass")
                                .imageScale(.large)
                                .padding(.horizontal)
                                .padding(.top)
                            
                        }.padding(.horizontal)
                        //                Visualización del Grid
                        HStack{
                            Text(catName.rawValue.replacingOccurrences(of: "_", with: " ").capitalized)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Spacer()
                            Button {
                                withAnimation(.easeOut){
                                    if self.columns.count == 2 {
                                        self.columns.removeLast()
                                    }
                                    else{
                                        self.columns.append(GridItem(.flexible(), spacing: 15))
                                    }
                                }
                            } label: {
                                Image(systemName: self.columns.count == 2 ? "rectangle.grid.1x2" : "square.grid.2x2")
                            }
                            
                        }.padding(.horizontal)
                        LazyVGrid(columns: self.columns,spacing : 25){
                            ForEach(movieData.moviesFilters.results){ movie in
//                                NavigationLink(
//                                    destination: DetailMovie(movieId: movie.id.description, imagePath: movie.backdropPath)){
//                                gridview(movie: movie, columns: self.$columns)
//
                                    
                                        gridview(movie: movie, columns: self.$columns)
                                    
//                                }
                            }
                            
                        }.padding([.horizontal,.top])
                    }
                    
                }
        }.navigationTitle("Miguel Requena Movies")
        }
    }
}

struct gridview: View {
    var movie : Movie
    @Binding var columns : [GridItem]
    @Namespace var namespace
    @State private var showFullScreen = false
    @State var showLink = false

    var body: some View {


        Button(action: {
            self.showLink.toggle()
        }) {
            VStack{
                if self.columns.count == 2 {
                    VStack(spacing:10){
                        ZStack(alignment: Alignment(horizontal:  .trailing, vertical: .top)) {
                            
                            
                            AsyncImage(
                                url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")!,
                                placeholder: { Text("Loading ...") },
                                image: { Image(uiImage: $0)
                                    .resizable()
                                }
                            ).frame( height: 250)
                            

                                Image(systemName: "plus.viewfinder")
                                    .foregroundColor(.red)
                                    .padding(.all,10)
                                    .background(Color.white)
                                    .clipShape(Circle())
                            
                            
                        }
                        .matchedGeometryEffect(id: "image", in: self.namespace)
                        
                        
                        
                        Text(movie.title)
                            .fontWeight(.bold)
                            .lineLimit(1)
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: "title", in: self.namespace)
                    }
                    
                } else {
                    HStack(spacing:15){
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                            AsyncImage(
                                url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")!,
                                placeholder: { Text("Loading ...") },
                                image: { Image(uiImage: $0)
                                    .resizable()
                                    
                                }
                            ).frame(width: (UIScreen.main.bounds.width - 45)/2, height: 250)
                            
                                Image(systemName: "plus.viewfinder")
                                    .foregroundColor(.red)
                                    .padding(.all,10)
                                    .background(Color.white)
                                    .clipShape(Circle())
                            
                        }
                        .matchedGeometryEffect(id: "image", in: self.namespace)
                        Spacer()
                        VStack{
                            Text(movie.title)
                                .font(.headline)
                                .fontWeight(.bold)
                                .lineLimit(3)
                                .foregroundColor(.blue)
                                .matchedGeometryEffect(id: "title", in: self.namespace)
                            Spacer()
                            Text(movie.overview)
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .lineLimit(8)
                                .foregroundColor(.gray)
                                .matchedGeometryEffect(id: "overview", in: self.namespace)
                            Spacer()
                        }
                    }
                    
                }
            }
        }
        .sheet(isPresented: self.$showLink) {
            DetailMovieView(movieId: movie.id.description, imagePath: movie.backdropPath ?? "")
        }
        
    }
}


#if DEBUG
struct HomeMoviesCat_Previews : PreviewProvider {
    static var previews: some View {
        HomeMoviesCatView(catName: .popular)
            .colorScheme(.dark)
        
    }
}
#endif

