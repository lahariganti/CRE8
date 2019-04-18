//
//  ItemCell.swift
//  CRE8
//
//  Created by Lahari Ganti on 4/17/19.
//  Copyright © 2019 Lahari Ganti. All rights reserved.
//

import UIKit
import SDWebImage

class ItemCell: UITableViewCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var creatorNameLabel: UILabel!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 10
        cardView.layer.shadowColor = UIColor.bunker.cgColor
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowOffset = CGSize(width: 4, height: 4)
        cardView.layer.shadowRadius = 10
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
    }

    func configure(with item: Item) {
        creatorNameLabel.text = item.user?.username
        itemTitleLabel.text = item.title
        contentLabel.text = item.content
        if let avatarURL =  item.user?.avatarURL {
            userImageView.sd_setImage(with: URL(string: avatarURL), placeholderImage: UIImage(named: "invader"))
        }
    }
}
