//
//  ViewControllerAssembly.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 09/10/21.
//

import Swinject

class ViewControllerAssembly: Assembly {
  
  func assemble(container: Container) {
    container.register(SearchUserViewController.self) { r in
      let viewModel = r.resolve(SearchUserViewModel.self)!
      let controller = SearchUserViewController(viewModel: viewModel)
      return controller
    }.inObjectScope(.container)
  }
  
}
