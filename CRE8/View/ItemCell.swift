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
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var creatorNameLabel: UILabel!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemContentLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
    }

    func configure(with item: Item, contentIsHidden: Bool) {
        creatorNameLabel.text = item.user.username
        itemTitleLabel.text = item.title
        itemContentLabel.text = item.content
        itemContentLabel.isHidden = contentIsHidden
        if let avatarURL =  item.user.avatarURL {
            userImageView.sd_setImage(with: URL(string: avatarURL), placeholderImage: UIImage(named: "invader"))
        }
        if let itemImageString = item.itemImageString {
            itemImageView.sd_setImage(with: URL(string: itemImageString),placeholderImage: UIImage(named: "item_placeholder"))
        }
    }
}
