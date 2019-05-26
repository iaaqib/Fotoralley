//
//  RequestManagerMock.swift
//  FotoralleyTests
//
//  Created by Apple on 5/26/19.
//  Copyright © 2019 Aaqib Hussain. All rights reserved.
//

import Foundation
@testable import Fotoralley

class RequestManagerMock: RequestManager {
    
    override init() {
        super.init()
    }
    
    override func request<T: Resource>(type: ResourceProvider, _ request: Request, success: @escaping (T) -> (), failure: ((RequestError) -> ())?) {
        guard let data = loadJson(url: URL(fileURLWithPath: request.urlString)) else { return }
        let resource = type.provideResourceInstance()
        resource.resourceData(url: request.urlString, data)
        success(resource as! T)
    }
    
    private func loadJson(url: URL) -> Data? {
        do {
            let data = try Data(contentsOf: url, options: .dataReadingMapped)
            return data
        } catch {
            // handle error
            print(error.localizedDescription)
            return nil
        }
    }
}
