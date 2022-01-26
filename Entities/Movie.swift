//
//  Movie.swift
//  MovieDB
//
//  Created by Ivan Sanchez Corral on 18/1/22.
//

import Foundation
import UIKit


class Movie{
    var posterPath, title, date, overview: String
    var rating: Double
    
    init(title: String, overview: String, rating: Double, posterPath: String, date: String){

        self.title = title
        if(title.count > 22 ) {
            self.title.removeLast(title.count - 12)
            self.title.append("...")
        }
        self.overview = overview
        self.rating = rating
        self.posterPath = posterPath
        self.date = date
    }
    
    
}
