//
//  MainCoordinator.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 08/10/21.
//

import UIKit

class MainCoordinator: Coordinator {
  
  private let navigationController: UINavigationController
  
  init(navigationController: UINavigationController = UINavigationController()) {
    self.navigationController = navigationController
  }
  
  func start() {
    showSearchUserScreenScene()
  }
  
  func showSearchUserScreenScene() {
    let vc = SearchUserViewController()
    //vc.presenter.coordinator = self
    
    navigationController.pushViewController(vc, animated: true)
  }
  
  func showTweetsScreenScene() {
    let vc = TweetsViewController()
    //vc.presenter.coordinator = self
    
    navigationController.pushViewController(vc, animated: true)
  }
  
  func back() {
    navigationController.popViewController(animated: true)
  }
  
}
