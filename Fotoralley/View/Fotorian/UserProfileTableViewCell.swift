//
//  UserProfileTableViewCell.swift
//  Fotoralley
//
//  Created by Apple on 5/25/19.
//  Copyright © 2019 Aaqib Hussain. All rights reserved.
//

import UIKit

class UserProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        userImageView.layer.cornerRadius = userImageView.frame.size.height / 2.0
        userImageView.layer.masksToBounds = true
        userImageView.layer.borderWidth = 2
    }
    
    func populateModel(profile: Profile) {
        guard let user = profile.user,
            let imageURL = user.profileImage?.medium else { return }
        
        userImageView.layer.borderColor = profile.color!.hexColor.cgColor
        userDescriptionLabel.text = "Name: \(user.name ?? "")\nUsername: \(user.username ?? "")"
        RequestManager.shared.request(Request(urlString: imageURL), success: { (imageRes: ImageResource) in
            self.userImageView.image = imageRes.image
        })
        
    }
}
