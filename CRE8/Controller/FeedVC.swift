//
//  FeedVC.swift
//  CRE8
//
//  Created by Lahari Ganti on 4/17/19.
//  Copyright © 2019 Lahari Ganti. All rights reserved.
//

import UIKit
import Alamofire

class FeedVC: UIViewController {
    @IBOutlet weak var feedTableView: UITableView!
    var items = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fetchItems()
    }
}


extension FeedVC {
    func setUpTableView() {
        let itemCell = UINib(nibName: "ItemCell", bundle: nil)
        feedTableView.register(itemCell, forCellReuseIdentifier: "ItemCell")
        feedTableView.dataSource = self
        feedTableView.delegate = self

        feedTableView.backgroundColor = .greenVogue
        feedTableView.separatorStyle = .none
        feedTableView.tableFooterView = UIView()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}


extension FeedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let item = self.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.selectionStyle = .none
//        cell.configure(with: item)
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
