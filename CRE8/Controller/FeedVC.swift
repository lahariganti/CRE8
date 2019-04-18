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
        setupNavBar()
        setUpTableView()
        fetchItems()
    }
}


extension FeedVC {
    func setupNavBar() {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: now)

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .greenVogue
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic

        title = "CRE8\n\(nameOfMonth)"
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.greenVogue,
            NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: 40) ?? UIFont.preferredFont(forTextStyle: .largeTitle)
        ]

        for navItem in (navigationController?.navigationBar.subviews)! {
            for itemSubView in navItem.subviews {
                if let largeLabel = itemSubView as? UILabel {
                    largeLabel.text = title
                    largeLabel.numberOfLines = 0
                    largeLabel.lineBreakMode = .byWordWrapping
                }
            }
        }
    }

    func setUpTableView() {
        let itemCell = UINib(nibName: "ItemCell", bundle: nil)
        feedTableView.register(itemCell, forCellReuseIdentifier: "ItemCell")
        feedTableView.dataSource = self
        feedTableView.delegate = self
        feedTableView.separatorStyle = .none
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 575.0
    }
}


extension FeedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.selectionStyle = .none
        cell.configure(with: item)
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
