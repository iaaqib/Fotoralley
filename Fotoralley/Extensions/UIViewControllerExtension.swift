//
//  UIViewControllerExtension.swift
//  Fotoralley
//
//  Created by Apple on 5/26/19.
//  Copyright © 2019 Aaqib Hussain. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlertController(title: String? = nil, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
    }
}
