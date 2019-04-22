//
//  FeedVC.swift
//  CRE8
//
//  Created by Lahari Ganti on 4/17/19.
//  Copyright © 2019 Lahari Ganti. All rights reserved.
//

import UIKit
import Alamofire
import RLBAlertsPickers

class FeedVC: UIViewController {
    @IBOutlet weak var feedTableView: UITableView!
    var items = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setUpTableView()
        fetchItems()
    }
}

extension FeedVC {
    func setupNavBar() {
        navigationController?.navigationBar.tintColor = .greenVogue
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "location_outline"), style: .plain, target: self, action: #selector(locationButtonTapped))
        let logoButton = UIButton(type: .custom)
        logoButton.translatesAutoresizingMaskIntoConstraints = false
        logoButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        logoButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        logoButton.contentMode = .scaleAspectFill
        logoButton.setImage(UIImage(named: "conexus"), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoButton)
    }

    func setUpTableView() {
        let itemCell = UINib(nibName: "ItemCell", bundle: nil)
        feedTableView.register(itemCell, forCellReuseIdentifier: "ItemCell")
        feedTableView.dataSource = self
        feedTableView.delegate = self
        feedTableView.separatorStyle = .none
        feedTableView.backgroundColor = .greenVogue
    }

    @objc func locationButtonTapped() {
        let alert = UIAlertController(style: .actionSheet)
        alert.addLocationPicker { location in
           print(location)
        }
        alert.addAction(title: "Cancel", style: .cancel)
        alert.show()
    }
}


extension FeedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count - 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.selectionStyle = .none
        cell.configure(with: item, contentIsHidden: true)
        return cell
    }
}


extension FeedVC: UITableViewDelegate {
    func fetchItems() {
        ItemInteractor.shared.fetchItems { (items, error) in
            guard error == nil else { return }
            self.items = items
            DispatchQueue.main.async {
                self.feedTableView.reloadData()
            }
        }
    }
}
