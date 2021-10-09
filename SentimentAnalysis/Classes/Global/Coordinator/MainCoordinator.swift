//
//  MainCoordinator.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 08/10/21.
//

import Swinject

class MainCoordinator: Coordinator {
  
  private let navigationController: UINavigationController
  
  let container: Container = {
    let container = Container()
    
    let assembler = Assembler(container: container)
    assembler.apply(assemblies: [RepositoryAssembly(), UseCaseAssembly(), ViewModelAssembly(), ViewControllerAssembly()])
    
    return container
  }()
  
  init(navigationController: UINavigationController = UINavigationController()) {
    self.navigationController = navigationController
  }
  
  func start() {
    showSearchUserScreenScene()
  }
  
  func showSearchUserScreenScene() {
    let controller = container.resolve(SearchUserViewController.self)
    controller?.viewModel.coordinator = self
    
    navigationController.pushViewController(controller!, animated: true)
  }
  
  func showTweetsScreenScene(userId: String) {
    let controller = container.resolve(TweetsViewController.self)
    controller?.userId = userId
    
    navigationController.pushViewController(controller!, animated: true)
  }
  
}
