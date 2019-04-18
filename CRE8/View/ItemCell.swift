//
//  ItemCell.swift
//  CRE8
//
//  Created by Lahari Ganti on 4/17/19.
//  Copyright © 2019 Lahari Ganti. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet weak var cardShadowView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var backgroundInnerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 10
        cardShadowView.layer.cornerRadius = 10
        background.layer.cornerRadius = 10
        backgroundInnerView.layer.cornerRadius = 10
        background.backgroundColor = .darkBackground
    }

}
