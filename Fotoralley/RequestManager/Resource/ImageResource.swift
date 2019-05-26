//
//  ImageResource.swift
//  Fotoralley
//
//  Created by Apple on 5/25/19.
//  Copyright © 2019 Aaqib Hussain. All rights reserved.
//

import UIKit

class ImageResource: Resource {
    
    var image: UIImage!
    
    func resourceData(url: String, _ data: Data) {
        image = UIImage(data: data)
        Cache.shared.setToCache(url: url, data: data)
    }
    
}
