//
//  SearchUserViewController.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 08/10/21.
//

import UIKit
import BRYXBanner

class SearchUserViewController: BaseViewController<SearchUserViewModel> {
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.searchUserByUsername("maurocezar")
    
    setupBindings()
  }
  
  // MARK: - Internal functions
  
  func setupBindings() {    
    viewModel.userNotFound.drive(onNext: { (userNotFound) in
      if userNotFound {
        let banner = Banner(title: NSLocalizedString("search.user.not.found.message", comment: ""), subtitle: "", image: nil, backgroundColor: .orange)
        banner.dismissesOnTap = true
        banner.show(duration: 2.0)
      }
    }).disposed(by: disposeBag)
    
    viewModel.error.drive(onNext: { (_error) in
      if let error = _error {
        self.showError(error)
      }
    }).disposed(by: disposeBag)
  }

}
