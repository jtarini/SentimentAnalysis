//
//  TweetsView.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 11/10/21.
//

import UIKit

class TweetsView: UIView {
  
  lazy var tweetsTableView: UITableView = {
    let view = UITableView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.register(TweetsTableViewCell.self, forCellReuseIdentifier: "TweetsTableViewCell")
    
    return view
  }()

  init() {
    super.init(frame: .zero)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension TweetsView: ViewCodable {

  func buildHierarchy() {
    addSubview(tweetsTableView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      tweetsTableView.topAnchor.constraint(equalTo: topAnchor),
      tweetsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
      tweetsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      tweetsTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }
  
}
