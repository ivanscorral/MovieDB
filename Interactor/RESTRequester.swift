//
//  RESTRequester.swift
//  MovieDB
//
//  Created by Ivan Sanchez Corral on 18/1/22.
//

import Foundation

class RESTRequester {
    
    static func getRequest(url: URL?, _ completion: @escaping(Data?, URLResponse?, Error?) -> ()){
        guard let url = url else {
            completion(nil, nil, nil)
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func postRequest() -> Data? {
        return nil
    }
    

}
