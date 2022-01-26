//
//  ImageFetcher.swift
//  MovieDB
//
//  Created by Ivan Sanchez Corral on 18/1/22.
//

import Foundation
import UIKit

class ImageFetcher {

    static func fetch(url: URL?, handler: @escaping (_ image: UIImage?) -> ()){
        print("Descargando Imagen")
        
        RESTRequester.getRequest(url: url!, {
            data, response, error in
            if let imageData = data {
                handler(UIImage(data: imageData))
            }else {
                print(error)
                handler(nil)
            }
        })
    }
}
