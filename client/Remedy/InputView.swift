//
//  InputView.swift
//  Remedy
//
//  Created by Matthew Cheok on 2/4/18.
//  Copyright © 2018 Matthew Cheok. All rights reserved.
//

import UIKit

class InputView: UIView {
  
  let textField = UITextField()
  let sendButton = UIButton()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

  override init(frame: CGRect) {
    super.init(frame: frame)
    textField.borderStyle = .roundedRect
    textField.placeholder = "Send a message"
    
    sendButton.setTitle("Send", for: .normal)
    sendButton.setTitleColor(UIColor.black, for: .normal)
    backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.9529, alpha: 1)
    addSubview(textField)
    addSubview(sendButton)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    textField.frame = CGRect(x: 10, y: 10, width: bounds.width-20-60, height: 44)
    sendButton.frame = CGRect(x: bounds.width-60, y: 10, width: 50, height: 44)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
