//
//  TMDBClient.swift
//  MovieDB
//
//  Created by Ivan Sanchez Corral on 18/1/22.
//

import Foundation

class TMDBClient {
    
    static func getPopularMovies(completion: @escaping ([Movie]) -> ()){
        let apiUrl = Endpoint.getPopularURL()
        RESTRequester.getRequest(url: URL(string: apiUrl), {
            data, response, error in

            if let responseData = data  {
                let popularMovies = try? JSONDecoder().decode(MResponse.self, from: responseData).results
                completion(movieResponseToMovie(movies: popularMovies))
            }else{
                print(error.debugDescription)
            }
        })
    }
    
    
    static func searchMovies(query:String, completion: @escaping ([Movie]?) -> ()) {
        let apiUrl = Endpoint.getSearchURL(query)
        print(apiUrl)
        RESTRequester.getRequest(url: URL(string: apiUrl), {
        data, response, error in
        
             if let responseData = data  {
                 let searchResults = try? JSONDecoder().decode(SearchResults.self, from: responseData).results
                 print(searchResults)
                 completion(searchResponseToMovie(movies: searchResults))
             }else {
                 print(error.debugDescription)
             }
        })
    }
    
    static func searchResponseToMovie(movies: [Result]?) -> [Movie] {
        var simplifiedMovies: [Movie] = []
        if let movies = movies {
            for movie in movies{
                simplifiedMovies.append(Movie(title: movie.originalTitle, overview: movie.overview, rating: movie.voteAverage, posterPath: (tmdbPosterBaseURL + ( movie.posterPath ?? "")), date: movie.releaseDate ?? "-"))
            }
        }
        return simplifiedMovies
    }
    
    static func movieResponseToMovie(movies: [MovieResponse]?) -> [Movie] {
        var simplifiedMovies: [Movie] = []
        if let movies = movies {
            for movie in movies{
                simplifiedMovies.append(Movie(title: movie.title, overview: movie.overview, rating: movie.voteAverage, posterPath: (tmdbPosterBaseURL +  (movie.posterPath ?? "")), date: movie.releaseDate))
            }
        }
        return simplifiedMovies
    }
}
