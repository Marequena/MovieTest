//
//  DetailMovie.swift
//  MovieTest
//
//  Created by Miguel Angel Requena on 28-11-21.
//

import SwiftUI

struct DetailMovieView: View {
    var movieId : String
    var imagePath : String
    @ObservedObject var detailMovie = DetailMovieVM(mov: "0")
    @Environment(\.presentationMode) var mode
    
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                HStack{
                    Spacer()
                    Text(detailMovie.movie.title)
                        .foregroundColor(.blue)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                    
                    Spacer()
                    Button {
                        mode.wrappedValue.dismiss()
                        
                    } label: {
                        Image(systemName: "xmark.square.fill")
                            .font(.title)
                            .foregroundColor(.red)
                            .padding(.all,1)
                            .background(Color.white)
                            .clipShape(Circle())
                    }.padding(.all,1)
                }
                AsyncImage(
                    url: URL(string: "https://image.tmdb.org/t/p/w500\(imagePath)")!,
                    placeholder: { Text("Loading ...") },
                    image: { Image(uiImage: $0)
                        .resizable()
                    }
                ).frame(width: UIScreen.main.bounds.width-100, height: 250)
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(detailMovie.movie.productionCompanies) { item in
                        prodCompaniesView(item: item)
                    }
                    .padding(.horizontal)
                }
                .padding(.horizontal)
                
                VStack{
                    HStack{
                        HomePage(name: "Oficial Page", url: URL(string: detailMovie.movie.homepage))
                            .padding()
                            .listRowInsets(EdgeInsets())
                    }
                    
                    Collapsible(
                        label: { Text("Description") },
                        content: {
                            HStack {
                                Text(detailMovie.movie.overview)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .lineLimit(20)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                        }
                    )
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                }
                Collapsible(
                    label: { Text("Movie Genre") },
                    content: {
                        HStack {
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(detailMovie.movie.genres) { item in
                                    Text(item.name)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                    }
                )
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                
                
                Spacer()
                HStack{ Text("List videos")
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .foregroundColor(.blue)
                    .padding(.horizontal)
                    Spacer()
                }
                
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(detailMovie.movieVideos.results) { item in
                        LinkRow(name: item.name, url: URL(string: "https://www.youtube.com/watch?v=\(item.key)"))
                            .padding()
                            .listRowInsets(EdgeInsets())
                    }
                }
                .padding(.horizontal)
                
            }.onAppear(){
                detailMovie.loadMovie(mov: movieId)
                detailMovie.loadMovieVideo(mov: movieId)
            }
            HStack{
                Spacer()
                Text(detailMovie.movie.title)
                    .foregroundColor(.blue)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
                Spacer()
                Button {
                    mode.wrappedValue.dismiss()
                    
                } label: {
                    Image(systemName: "xmark.square.fill")
                        .font(.title)
                        .foregroundColor(.red)
                        .padding(.all,1)
                        .background(Color.white)
                        .clipShape(Circle())
                }.padding(.all,1)
            }
        }
    }
}

struct DetailMovie_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView(movieId: "1", imagePath: "")
    }
}



struct LinkRow: View {
    
    var name: String
    var url: URL?
    @State var showLink = false
    
    var body: some View {
        Button(action: {
            self.showLink.toggle()
        }) {
            VStack{
                Text(name)
                .font(.caption)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.primary)
                
                Image(systemName: "play.circle.fill")
                    .foregroundColor(.red)
                    .padding(.all,10)
                    .background(Color.white)
                    .clipShape(Circle())
            }
            
        }
        .sheet(isPresented: self.$showLink) {
            SafariView(url: self.url!)
        }
        .edgesIgnoringSafeArea(.bottom)

    }
}

struct prodCompaniesView: View {
    var item : ProductionCompany
    var body: some View {
        HStack{
            Text(item.name ?? "N/A")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            
            AsyncImage(
                url: URL(string: "https://image.tmdb.org/t/p/w500\(item.logoPath ?? "")")!,
                placeholder: { Text("") },
                image: { Image(uiImage: $0)
                    .resizable()
                }).frame(width:30, height: 30)
                .clipShape(Circle())
            
        }.frame(height: 30)
    }
}


struct HomePage: View {
    
    var name: String
    var url: URL?
    @State var showLink = false
    
    var body: some View {
        Button(action: {
            self.showLink.toggle()
        }) {
            HStack{
                Text(name)
                .font(.headline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.blue)
                Spacer()
                Image(systemName: "network")
                    .foregroundColor(.blue)
                    .padding(.all,10)
                    .background(Color.white)
                    .clipShape(Circle())
            }
            
        }
        .sheet(isPresented: self.$showLink) {
            SafariView(url: self.url!)
        }
        .edgesIgnoringSafeArea(.bottom)

    }
}
