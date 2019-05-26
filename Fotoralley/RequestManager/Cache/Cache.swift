//
//  Cache.swift
//  Fotoralley
//
//  Created by Apple on 5/25/19.
//  Copyright © 2019 Aaqib Hussain. All rights reserved.
//

import UIKit

class Cache {
    
    // MARK: - Vars
    
    //Singleton
    private(set) static var shared = Cache()
    
    //Object of NSCache to manage the overall cache of application
    private var cache: NSCache<NSString, NSData> = NSCache<NSString, NSData>()
    
    // MARK: - Init
    
    //Setting cache properties for NSCache object
    private init() {
        cache.countLimit = 100
        cache.totalCostLimit = 10*10*1024
        cache.evictsObjectsWithDiscardedContent = true
    }
    
    // MARK: - Functions
    
    func setToCache(url: String, data: Data) {
        Cache.shared.cache.setObject(data.nsData, forKey: url as NSString)
    }
    
    func returnData(url: String) -> Data? {
        return Cache.shared.cache.object(forKey: url as NSString) as Data?
    }
    
    func clearCache() {
        Cache.shared.cache.removeAllObjects()
    }
    
}
