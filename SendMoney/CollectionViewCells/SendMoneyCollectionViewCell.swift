//
//  SendMoneyCollectionViewCell.swift
//  SendMoney
//
//  Created by Ansal Antony on 28/06/20.
//  Copyright © 2020 Ansal Antony. All rights reserved.
//

import UIKit

class SendMoneyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewDoted: DesignableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let color = UIColor(red: 72.0/255, green: 205.0/255, blue: 194.0/255, alpha: 1.0)
        self.viewDoted.addDashedBorder(colour: color)
    }

}
