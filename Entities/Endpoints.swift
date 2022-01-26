//
//  Endpoints.swift
//  MovieDB
//
//  Created by Ivan Sanchez Corral on 18/1/22.
//

import Foundation


class Endpoint {

    
    static func getPopularURL() -> String{
        return tmdbApiBaseURL + popularMovies + commonParam + "&lang=\(langSpa)"
    }
    
    static func getSearchURL(_ query: String) -> String {
        return tmdbApiBaseURL + "\(searchMovie)\(commonParam)" + "&query=\(query)" + "&page=1&include_adult=false"
    }

}
