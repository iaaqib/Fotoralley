//
//  FotorianListViewController.swift
//  Fotoralley
//
//  Created by Aaqib Hussain on 20/5/19.
//  Copyright © 2019 Aaqib Hussain. All rights reserved.
//

import UIKit

class FotorianListViewController: UIViewController {
    
    //MARK: - Vars
    
    @IBOutlet weak var tableView: UITableView!
    let refControl = UIRefreshControl()
    
    //Model
    var fotorianListModel = FotorianListModel()
    
    //MARK: - View cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fotorianListModel.view = self
        fotorianListModel.fetchFotorians()
    }
    
    //MARK: - Functions
    
    func setupUI() {
        self.tableView.refreshControl = refControl
        self.refControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
    }
    
    @objc func pullToRefresh() {
        fotorianListModel.fetchFotorians()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ImageViewController
        if let index = sender as? Int {
            destination.profile = fotorianListModel.profiles[index]
        }
    }
}

extension FotorianListViewController: FotorianListViewProtocol {
    
    //MARK: - FotorianListViewProtocol
    
    func reload() {
        self.refControl.endRefreshing()
        self.tableView?.reloadData()
        
    }
    
    func showMessage(message: String) {
        self.refControl.endRefreshing()
        self.showAlertController(message: message)
    }
}

extension FotorianListViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: TableviewDatasource & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fotorianListModel.profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserProfileTableViewCell.className, for: indexPath) as! UserProfileTableViewCell
        let profile = fotorianListModel.profiles[indexPath.row]
        cell.populateModel(profile: profile)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: ImageViewController.className, sender: indexPath.row)
    }
}






