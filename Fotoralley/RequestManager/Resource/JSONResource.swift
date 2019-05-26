//
//  JSONResource.swift
//  Fotoralley
//
//  Created by Apple on 5/25/19.
//  Copyright © 2019 Aaqib Hussain. All rights reserved.
//

import Foundation

class JSONResource: Resource {
    
    var dictionary: [String : Any]?
    var array: [Any]?
    var dataUTF8String: String?
    var data: Data?
    var url: String?
    
    func resourceData(url: String, _ data: Data) {
        self.data = data
        do {
            dataUTF8String = String(data: data, encoding: .utf8)
            dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            array = try JSONSerialization.jsonObject(with: data, options: []) as? [Any]
            Cache.shared.setToCache(url: url, data: data)
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func mapped<T: Codable>() -> T? {
        guard let data = self.data else {return nil}
        let model: T? = try? JSONDecoder().decode(T.self, from: data)
        return model
    }
}
