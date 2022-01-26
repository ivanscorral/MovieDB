//
//  Constants.swift
//  MovieDB
//
//  Created by Ivan Sanchez Corral on 18/1/22.
//

import Foundation

let apiKey: String = "10fa6cc9976a8851815170b63a936492"
let commonParam: String = "?api_key=\(apiKey)&lang=\(langSpa)"
//IDIOMAS
let langSpa: String = "es_ES"
let langEng: String = "en_US"
//URLS BASE
let tmdbApiBaseURL: String = "https://api.themoviedb.org/3/"
let tmdbPosterBaseURL: String = "https://image.tmdb.org/t/p/w400"
///ENDPOINTS
let popularMovies: String = "movie/popular"
let searchMovie: String = "search/movie"
