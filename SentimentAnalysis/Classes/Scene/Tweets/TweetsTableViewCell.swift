//
//  TweetsTableViewCell.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 11/10/21.
//

import UIKit

class TweetsTableViewCell: UITableViewCell {
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  var tweet: Tweet! {
    
    didSet {
      textLabel?.text = tweet.text
      textLabel?.numberOfLines = 0
      textLabel?.lineBreakMode = .byWordWrapping
    }
    
  }
  
}
