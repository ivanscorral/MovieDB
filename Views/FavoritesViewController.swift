//
//  FavoritesViewController.swift
//  MovieDB
//
//  Created by Ivan Sanchez Corral on 18/1/22.
//

import Foundation
import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var testImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TMDBClient.searchMovies(query: "Origen", completion: {
            movies in
                
	        })
        // Do any additional setup after loading the view.
        ImageFetcher.fetch(url: URL(string: "https://depor.com/resizer/mNPYsFUUXAWuzKsMz7qkpkL3MOM=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/FNS5H6L6YNAV7EESJ4K5IWZMIE.jpg"), handler: {
                image in
                DispatchQueue.main.async {
                    self.testImageView.image = image
                }
            })
        }
}
