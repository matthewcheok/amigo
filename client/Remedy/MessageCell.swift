//
//  MessageCell.swift
//  Remedy
//
//  Created by Matthew Cheok on 2/4/18.
//  Copyright © 2018 Matthew Cheok. All rights reserved.
//

import UIKit

class MessageCell: UICollectionViewCell {
  @IBOutlet weak var bubbleView: UIView!
  @IBOutlet weak var contentLabel: UILabel!
  var widthConstraint: NSLayoutConstraint!
  override func awakeFromNib() {
    super.awakeFromNib()
    widthConstraint = contentView.widthAnchor.constraint(equalToConstant: 0)
    bubbleView?.layer.cornerRadius = 8
  }
  
  var width: CGFloat = 0.0 {
    didSet {
      widthConstraint.constant = width
      widthConstraint.isActive = true
    }
  }
}
