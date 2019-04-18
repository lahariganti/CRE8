//
//  ItemCell.swift
//  CRE8
//
//  Created by Lahari Ganti on 4/17/19.
//  Copyright © 2019 Lahari Ganti. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var creatorNameLabel: UILabel!
    @IBOutlet weak var itemTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        itemImageView.layer.cornerRadius = 10
    }

    func configure(with item: Item) {
        creatorNameLabel.text = item.id
        itemTitleLabel.text = item.title
    }
}
