//
//  RequestManager.swift
//  Fotoralley
//
//  Created by Apple on 5/23/19.
//  Copyright © 2019 Aaqib Hussain. All rights reserved.
//

import UIKit

class RequestManager: NSObject {
    
    static let shared = RequestManager()
    
    private var session: URLSession!
    
    private var activeRequests: [String : Task] = [:]
    
    override init() {
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }
    
    // MARK: - Functions
    
    /**
     Downloads from a URL or returns from Cache.
     
     - Parameter type: Type of the object trying to download. Could be a json or image or anything else.
     
     - Parameter request: Requires a request object with a url string and a RequestType could either be .get or .post with params and headers.
     
     - Parameter cacheEnabled: Default value is true. Fetches new data everytime if set to false.
     
     - Parameter success: A success is a closure of type <T: Resource>. The Resource you provide from where the function is being called. That type of Resource will be returned back. If its the correct type.
     
     - Parameter failure: A failure closure returns an error.
     */
    
    func request<T: Resource>(type: ResourceProvider = .image, _ request: Request, cacheEnabled: Bool = true, success: @escaping (_ data: T) -> (), failure: ((_ error: RequestError) -> ())? = nil) {

        if let data = Cache.shared.returnData(url: request.urlString), cacheEnabled {
            
            guard let resource: T =  type.provideResourceInstance() as? T else {
                failure?(.invalidResourceType)
                return
            }
            resource.resourceData(url: request.urlString, data)
            success(resource)
            
        } else {
            let task = Task(url: request.urlString)
            guard let createRequest = request.createRequest() else { failure?(.requestCreationError)
                return
            }
            task.sessionTask = session.dataTask(with: createRequest, completionHandler: { (data, response, error) in
                
                DispatchQueue.main.async {
                    if let err = error {
                        failure?(.errorOccured(message: err.localizedDescription))
                    } else {
                        guard let resource: T =  type.provideResourceInstance() as? T,
                            let data = data else {
                                failure?(.invalidResourceType)
                                return
                        }
                        resource.resourceData(url: request.urlString, data)
                        self.activeRequests[request.urlString] = nil
                        success(resource)
                    }
                }
                
            })
            
            task.sessionTask?.resume()
            activeRequests[request.urlString] = task
        }
    }
    
    func cancelRequest(_ url: String) {
        if let download = activeRequests[url] {
            download.sessionTask?.cancel()
            activeRequests[url] = nil
        }
    }
}
