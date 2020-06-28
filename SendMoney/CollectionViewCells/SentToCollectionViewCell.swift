//
//  SentToCollectionViewCell.swift
//  SendMoney
//
//  Created by Ansal Antony on 27/06/20.
//  Copyright © 2020 Ansal Antony. All rights reserved.
//

import UIKit

class SentToCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageViewSentTo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
      self.imageViewSentTo.layer.masksToBounds = false
      self.imageViewSentTo.layer.cornerRadius =  self.imageViewSentTo.frame.height/2
      self.imageViewSentTo.clipsToBounds = true
    }

}
