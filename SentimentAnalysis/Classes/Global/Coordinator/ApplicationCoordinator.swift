//
//  ApplicationCoordinator.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 08/10/21.
//

import UIKit

class ApplicationCoordinator: Coordinator {
  
  private let window: UIWindow
  private let navigationController: UINavigationController
  var starterCoordinator: Coordinator?
  
  init(window: UIWindow = UIWindow(), navigationController: UINavigationController = UINavigationController()) {
    self.window = window
    self.navigationController = navigationController
    
    setupWindow()
    setupStarterCoordinator()
  }
  
  func setupWindow() {
    self.window.rootViewController = navigationController
    self.window.makeKeyAndVisible()
  }
  
  func setupStarterCoordinator() {
    starterCoordinator = MainCoordinator(navigationController: navigationController)
  }
  
  func start() {
    starterCoordinator?.start()
  }
  
}
