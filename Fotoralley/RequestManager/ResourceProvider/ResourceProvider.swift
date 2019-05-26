//
//  ResourceProvider.swift
//  Fotoralley
//
//  Created by Apple on 5/25/19.
//  Copyright © 2019 Aaqib Hussain. All rights reserved.
//

import UIKit

enum ResourceProvider {
    
    case image
    case json
    
    /**
     Provides a certain Resource on basis of selected Enum. In the future this class can be more expanded by added further cases for instance xml, or even a pdf.
    */
    
    func provideResourceInstance() -> Resource {
        var resource: Resource!
        switch self {
        case .image:
            resource = ImageResource()
            break
        case .json:
            resource = JSONResource()
            break
        }
        return resource
    }
    
}
