//
//  SearchUserView.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 11/10/21.
//

import UIKit

class SearchUserView: UIView {
  
  lazy var usernameField: UITextField = {
    let view = UITextField()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.placeholder = NSLocalizedString("search.user.twitter.username", comment: "")
    view.autocorrectionType = .no
    view.autocapitalizationType = .none
    view.clearButtonMode = .whileEditing
    
    return view
  }()
  
  lazy var searchButton: UIButton = {
    let view = UIButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setTitle(NSLocalizedString("search.user.search.tweets", comment: ""), for: .normal)
    view.backgroundColor = UIColor(red: 29 / 255, green: 161 / 255, blue: 242 / 255, alpha: 1.0)
    
    return view
  }()
  
  lazy var contentView: UIStackView = {
    let view = UIStackView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.axis = .vertical
    view.spacing = 10.0
    view.alignment = .center
    view.distribution = .equalSpacing
    
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

extension SearchUserView: ViewCodable {

  func buildHierarchy() {
    [usernameField, searchButton].forEach { contentView.addArrangedSubview($0) }
    addSubview(contentView)
  }
  
  func setupConstraints() {
    usernameField.widthAnchor.constraint(equalToConstant: 300).isActive = true
    usernameField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    
    searchButton.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
    searchButton.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
    
    contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    contentView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }
  
  func applyAdditionalChanges() {
    backgroundColor = .white
  }
  
}
