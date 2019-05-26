//
//  ImageViewController.swift
//  Fotoralley
//
//  Created by Apple on 5/25/19.
//  Copyright © 2019 Aaqib Hussain. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    //MARK: - Vars
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var profile: Profile!
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadImage()
        tapGesture()
    }
    
    //MARK: - Functions
    
    func downloadImage() {
        guard let imageURL = profile.links?.download else {
                activityIndicator.stopAnimating()
                imageView.image = UIImage(named: "placeholder-featured-image")!
                return
        }
        RequestManager.shared.request(Request(urlString: imageURL), success: { (imageResource: ImageResource) in
            self.activityIndicator.stopAnimating()
            self.imageView.image = imageResource.image
        }) { (error) in
            self.activityIndicator.stopAnimating()
        }
    }
    
    func tapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dimissViewController))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dimissViewController() {
        dismiss(animated: true)
    }
    
}
