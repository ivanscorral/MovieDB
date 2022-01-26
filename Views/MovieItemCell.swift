//
//  MovieItemCell.swift
//  MovieDB
//
//  Created by Ivan Sanchez Corral on 19/1/22.
//

import UIKit

class MovieItemCell: UITableViewCell {
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    public var movie: Movie?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.posterImageView.image = nil
    }
    
    func setMovie(movie: Movie){
        DispatchQueue.main.async {
            let url = URL(string: movie.posterPath)!
            ImageFetcher.fetch(url: url, handler: {
                image in
                
                if let image = image {
                    DispatchQueue.main.async {
                        self.posterImageView.image = image ?? nil
                    }
                }
            })
            
            self.titleLabel.text = movie.title + " (\(movie.date.dropLast(6)))"
            self.ratingLabel.text = "\(movie.rating)/10"
            self.overviewLabel.text = movie.overview
        }
        
       
        func commonInit(movie: Movie){
            //posterImageView.image = movie.posterPath
            
        }
        
    }
}
