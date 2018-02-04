//
//  PagingFlowLayout.swift
//  Remedy
//
//  Created by Matthew Cheok on 2/4/18.
//  Copyright © 2018 Matthew Cheok. All rights reserved.
//

import UIKit

let width: CGFloat = 320

class PagingFlowLayout: UICollectionViewFlowLayout {
  override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
    
    guard let collectionView = collectionView else {
      return proposedContentOffset
    }
    
    let left = collectionView.contentInset.left
    
    let index = round((proposedContentOffset.x - left) / width)
    let target = CGPoint(x: index * width + left, y: proposedContentOffset.y)
    print("original", proposedContentOffset)
    print("target", target)
    return target
  }
}
