//
//  ShowsViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Benjamin Stone on 9/5/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var showsSearchBar: UISearchBar!
    
    @IBOutlet weak var showTableView: UITableView!
    var showListings = [ShowInfo]() {
        didSet {
            showTableView.reloadData()
        }
    }
    
     override func viewDidLoad() {
        super.viewDidLoad()
        showsSearchBar.delegate = self
        showTableView.delegate = self
        showTableView.dataSource = self
        
    }
    
    
    var searchString: String? {
        didSet {
            loadShowData()
            showTableView.reloadData()
        }
    }
        
    private func loadShowData() { APIClientManager.shared.getElements(searchString: searchString ?? "g") { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let success):
                self.showListings = success
                dump(self.showListings)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showListings.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = showTableView.dequeueReusableCell(withIdentifier: "showsCell", for: indexPath) as? ShowsTableViewCell else {
            return UITableViewCell()
        }
        let show = showListings[indexPath.row]
        cell.showRatingLabel.text = show.show.rating.average?.description
        cell.showNameLabel.text = show.show.name
        
        ImageFullManager.manager.getFullImage(from: show.show.image.medium) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let image):
                    cell.imageView?.image = image
                }
            }
        }
        
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchString = searchBar.text
    }
}


