//
//  ItemCell.swift
//  CRE8
//
//  Created by Lahari Ganti on 4/17/19.
//  Copyright © 2019 Lahari Ganti. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var creatorNameLabel: UILabel!
    @IBOutlet weak var itemTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
//        backgroundColor = .darkBackground
        cardView.layer.cornerRadius = 10
        cardView.layer.shadowColor = UIColor.bunker.cgColor
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowOffset = CGSize(width: 4, height: 4)
        cardView.layer.shadowRadius = 10
    }

    func configure(with item: Item) {
        creatorNameLabel.text = item.id
        itemTitleLabel.text = item.title
    }
}
