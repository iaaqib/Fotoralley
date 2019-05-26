//
//  Resource.swift
//  Fotoralley
//
//  Created by Apple on 5/25/19.
//  Copyright © 2019 Aaqib Hussain. All rights reserved.
//

import UIKit

/**
    This protocol needs to be implemented inside a class. In order to Parse json and image.
    More types can further be added by creating a class for instance: XMLResource or PDFResource and conforming it to Resource and implementing the method
        'resourceData(url: String, _ data: Data)' to handle the download of either xml or pdf.
 */
protocol Resource {
    func resourceData(url: String, _ data: Data)
}

enum RequestError: Error {
    case invalidURL
    case errorOccured(message: String)
    case invalidResourceType
    case requestCreationError
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid Url."
        case .invalidResourceType:
            return "Invalid type."
        case .errorOccured(let message):
            return message
        case .requestCreationError:
            return "Request cannot be created. Could be due to an invalid URL."
        }
    }
}
