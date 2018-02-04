//
//  ActivityCell.swift
//  Remedy
//
//  Created by Matthew Cheok on 2/4/18.
//  Copyright © 2018 Matthew Cheok. All rights reserved.
//

import UIKit

class ActivityCell: MessageCell {
  @IBOutlet weak var actionButton: UIButton!
  @IBOutlet weak var cancelButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    actionButton.layer.cornerRadius = 8
    cancelButton.layer.cornerRadius = 8
  }
}
