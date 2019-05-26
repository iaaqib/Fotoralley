//
//  File.swift
//  Fotoralley
//
//  Created by Apple on 5/26/19.
//  Copyright © 2019 Aaqib Hussain. All rights reserved.
//

import Foundation

// Model Protocol

protocol FotorianListViewModelProtocol {
    func fetchFotorians(url: String)
}

//Model Implementation

class FotorianListModel: FotorianListViewModelProtocol {
    
    var profiles: [Profile] = []
    var downloadManager = RequestManager.shared
    var view: FotorianListViewProtocol? = nil
    
    func fetchFotorians(url: String = Urls.profiles) {
        downloadManager.request(type: .json, Request(urlString: url), success: { [weak self] (jsonResource: JSONResource)  in
            guard let profiles: [Profile] = jsonResource.mapped() else { return }
            self?.profiles = profiles.unique{$0.user?.username ?? ""}
            self?.view?.reload()
        }) { [weak self] (error) in
            self?.view?.showMessage(message: error.localizedDescription)
            print(error.localizedDescription)
        }
    }
}


// View
protocol FotorianListViewProtocol {
    func reload()
    func showMessage(message: String)
}

