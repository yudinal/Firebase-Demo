//
//  ItemCell.swift
//  Firebase-Demo
//
//  Created by Lilia Yudina on 3/4/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var sellerNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    public func configureCell(for item: Item) {
        itemNameLabel.text = item.itemName
        sellerNameLabel.text = ("@\(item.sellerName)")
        dateLabel.text = item.listedDate.description
        let price = String(format: "%.2f",item.price)
        priceLabel.text = ("$\(price)")
    }
}

