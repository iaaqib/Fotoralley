//
//  Request.swift
//  Fotoralley
//
//  Created by Apple on 5/26/19.
//  Copyright © 2019 Aaqib Hussain. All rights reserved.
//

import UIKit

class Request {
    
    // MARK: - Vars
    
    var url: URL!
    var requestType: RequestType
    var urlString: String
    
    
    // MARK: - Init
    
    init(urlString: String, requestType: RequestType = .get) {
        self.urlString = urlString
        self.requestType = requestType
    }
    
    // MARK: - Function
    
    //Creates request object
    func createRequest() -> URLRequest? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        self.url = url
        switch requestType {
        case .get:
            return URLRequest(url: url)
            
        case .post(let params, let header):
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = header
            do {
                if let parameters = params {
                    request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                }
            } catch let error {
                print(error.localizedDescription)
            }
            return request
        }
    }
}

/**
    While creating Request object. RequestType needs to be provided either .get or .post with parameters.
 */

enum RequestType {
    case get
    case post(params: [String : Any]?, header: [String : String]?)
}

