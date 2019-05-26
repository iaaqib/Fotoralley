//
//  Task.swift
//  Fotoralley
//
//  Created by Apple on 5/25/19.
//  Copyright © 2019 Aaqib Hussain. All rights reserved.
//

import Foundation

class Task {
    
    var url: String
    var sessionTask: URLSessionTask?
    
    init(url: String) {
        self.url = url
    }
}


