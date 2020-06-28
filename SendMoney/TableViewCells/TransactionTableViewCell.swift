//
//  TransactionTableViewCell.swift
//  SendMoney
//
//  Created by Ansal Antony on 27/06/20.
//  Copyright © 2020 Ansal Antony. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var labelBank: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageViewProfile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageViewProfile.layer.masksToBounds = false
        self.imageViewProfile.layer.cornerRadius =  self.imageViewProfile.frame.height/2
        self.imageViewProfile.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
