//
//  TweetsViewController.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 08/10/21.
//

import UIKit
import Lottie
import SwiftSpinner

class TweetsViewController: BaseViewController<TweetsViewModel>, HasCustomView {
  
  // MARK: - Internal properties
  
  typealias CustomView = TweetsView
  var userId: String!
  let animationView = AnimationView()
    
  // MARK: - Lifecycle
  
  override func loadView() {
    let customView = CustomView()
    view = customView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    SwiftSpinner.show(NSLocalizedString("general.loading", comment: ""))
    viewModel.searchTweetsByUserId(userId)
    
    setupBindings()
  }
  
  // MARK: - Internal functions
  
  func setupBindings() {
    viewModel.tweets.bind(to: customView.tweetsTableView.rx.items(cellIdentifier: "TweetsTableViewCell", cellType: TweetsTableViewCell.self)) { (row, item, cell) in
      cell.tweet = item
      SwiftSpinner.hide()
    }.disposed(by: disposeBag)
    
    customView.tweetsTableView.rx.modelSelected(Tweet.self).subscribe(onNext: { item in
      SwiftSpinner.show(NSLocalizedString("general.loading", comment: ""))
      self.viewModel.getSentimentByText(item.text)
    }).disposed(by: disposeBag)
    
    viewModel.sentiment.drive(onNext: { (_sentiment) in
      if let sentiment = _sentiment {
        self.animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.animationView.center = self.view.center
        self.animationView.loopMode = .playOnce
        let path = Bundle.main.path(forResource: "\(sentiment.sentimentType)-emoji", ofType: "json") ?? ""
        self.animationView.animation = Animation.filepath(path)
        self.animationView.isHidden = false
        self.view.addSubview(self.animationView)
        self.animationView.play { (finished) in
          self.animationView.isHidden = true
        }
      }
      SwiftSpinner.hide()
    }).disposed(by: disposeBag)
    
    viewModel.error.drive(onNext: { (_error) in
      if let error = _error {
        self.showError(error)
      }
    }).disposed(by: disposeBag)
  }

}
