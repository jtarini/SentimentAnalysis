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
    assembler.apply(assemblies: [RepositoryAssembly(), UseCaseAssembly()])
    
    return container
  }()
  
  init(navigationController: UINavigationController = UINavigationController()) {
    self.navigationController = navigationController
  }
  
  func start() {
    showSearchUserScreenScene()
  }
  
  func showSearchUserScreenScene() {
    let viewModel = SearchUserViewModel()
    viewModel.getUserByUsernameUseCase = container.resolve(GetUserByUsernameUseCase.self)
    let controller = SearchUserViewController(viewModel: viewModel)
    controller.viewModel.coordinator = self
    
    navigationController.pushViewController(controller, animated: true)
  }
  
  func showTweetsScreenScene(userId: String) {
    let viewModel = TweetsViewModel()
    viewModel.getTweetsByUserIdUseCase = container.resolve(GetTweetsByUserIdUseCase.self)
    viewModel.getSentimentByTextUseCase = container.resolve(GetSentimentByTextUseCase.self)
    let controller = TweetsViewController(viewModel: viewModel)
    controller.userId = userId
    
    navigationController.pushViewController(controller, animated: true)
  }
  
}
