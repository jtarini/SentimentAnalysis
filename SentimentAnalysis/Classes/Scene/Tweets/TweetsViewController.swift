//
//  TweetsViewController.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 08/10/21.
//

import UIKit
import BRYXBanner

class TweetsViewController: BaseViewController<TweetsViewModel> {
  
  var userId: String!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.searchTweetsByUserId(userId)
    
    setupBindings()
  }
  
  // MARK: - Internal functions
  
  func setupBindings() {
    viewModel.tweets.drive(onNext: {[unowned self] (_) in
      
    }).disposed(by: disposeBag)
    
    viewModel.sentiment.drive(onNext: { (_sentiment) in
      if let sentiment = _sentiment {
        print(sentiment.score)
      }
    }).disposed(by: disposeBag)
    
    viewModel.error.drive(onNext: { (_error) in
      if let error = _error {
        self.showError(error)
      }
    }).disposed(by: disposeBag)
  }

}
