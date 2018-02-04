//
//  ViewController.swift
//  Remedy
//
//  Created by Matthew Cheok on 2/3/18.
//  Copyright © 2018 Matthew Cheok. All rights reserved.
//

import UIKit
import Apollo

class ViewController: UIViewController {
  
  let apollo = ApolloClient(url: URL(string: "https://mentalbuddy-server-hpltlgcbfq.now.sh")!)

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    apollo.fetch(query: GetUsersQuery()) {
      (result, error) in
      print(result?.data)
      ()
    }
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

