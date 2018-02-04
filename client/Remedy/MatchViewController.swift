//
//  MatchViewController.swift
//  Remedy
//
//  Created by Matthew Cheok on 2/4/18.
//  Copyright © 2018 Matthew Cheok. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  @IBOutlet weak var collectionView: UICollectionView!
  
  func fetchChat() {
    if navigationController?.topViewController != self {
      return
    }
    DataManager.shared.getChat { (chatId) in
      if chatId != nil {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        self.navigationController?.pushViewController(vc, animated: true)
      }
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
    cell.layer.cornerRadius = 10
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 300, height: 150)
  }
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let x = collectionView.contentOffset.x + scrollView.contentInset.left
    let index = velocity.x > 0 ? ceil(x / 320.0) : floor(x / 320.0)
    let newX = (index * 320.0) - scrollView.contentInset.left
    targetContentOffset.pointee.x = newX
  }
  
  var timer: Timer?
  

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      guard let layout = collectionView.collectionViewLayout as? PagingFlowLayout else {
        return
      }

      layout.scrollDirection = .horizontal
      layout.minimumLineSpacing = 20
      collectionView.showsHorizontalScrollIndicator = false
      
      let tap = UITapGestureRecognizer(target: self, action: #selector(MatchViewController.handleTap))
      view.addGestureRecognizer(tap)
      
      let timer =
        Timer(timeInterval: 5, repeats: true
        , block: { (timer) in
          self.fetchChat()
      })
      RunLoop.main.add(timer, forMode: .commonModes)
      self.timer = timer
  }
  
  @objc
  func handleTap() {
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChatViewController")
    navigationController?.pushViewController(vc, animated: true)
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    let offset = (view.bounds.width - 300) / 2
    collectionView.contentInset = UIEdgeInsets(top: 0, left: offset, bottom: 0, right: offset)
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
