//
//  ChatViewController.swift
//  Remedy
//
//  Created by Matthew Cheok on 2/4/18.
//  Copyright © 2018 Matthew Cheok. All rights reserved.
//

import UIKit

enum Content {
  case Message(isSender: Bool, text: String)
  case Activity(prompt: String)
  case ActivityCompleted
}

class ChatViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
  var content = [Content]()
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return content.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let m: MessageCell
    switch content[indexPath.row] {
    case let .Message(isOwner, text):
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: isOwner ? "RightMessage" : "LeftMessage", for: indexPath) as? MessageCell else {
        fatalError()
      }
      
      cell.contentLabel.text = text
      m = cell
    case .Activity(let prompt):
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Activity", for: indexPath) as? MessageCell else {
        fatalError()
      }
      
      m = cell
    case .ActivityCompleted:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuddyActivity", for: indexPath) as? MessageCell else {
        fatalError()
      }
      
      m = cell
    }
  
    m.width = view.bounds.width
    return m
  }
  
  
  let inputBar = InputView()
  var timer: Timer?
  
  func fetchMessages() {
    DataManager.shared.getMessages { (content) in
      let prevCount = self.content.count
      self.content = content
      if content.count > prevCount {
        let indexPaths = (prevCount..<content.count).map { IndexPath(item: $0, section: 0)}
        self.collectionView.insertItems(at: indexPaths)
      }
    }
  }
  
      override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        inputBar.bounds = CGRect(x: 0, y: 0, width: view.bounds.width, height: 80)
        inputBar.sendButton.addTarget(self, action: #selector(ChatViewController.sendMessage), for: .touchUpInside)
        becomeFirstResponder()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ChatViewController.handleTap))
        view.addGestureRecognizer(tap)
        
        collectionViewLayout?.estimatedItemSize = CGSize(width: 1, height: 1)
        
        let timer =
          Timer(timeInterval: 5, repeats: true
            , block: { (timer) in
              self.fetchMessages()
          })
        RunLoop.main.add(timer, forMode: .commonModes)
        self.timer = timer
    }
  
  @objc
  func handleTap() {
   inputBar.textField.resignFirstResponder()
  }
  
  @objc
  func sendMessage() {
    guard let message = inputBar.textField.text else {
      return
    }
    
    inputBar.textField.resignFirstResponder()
    inputBar.textField.text = nil
    
    DataManager.shared.createMessage(text: message) {
      (m) in
      self.content.append(m)
      self.collectionView.insertItems(at: [IndexPath(row: self.content.count - 1, section: 0)])
    }
  }

  
  override var canBecomeFirstResponder: Bool {
    return true
  }
  
  override var inputAccessoryView: UIView? {
    return inputBar
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()

  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
