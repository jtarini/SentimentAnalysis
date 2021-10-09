//
//  ViewModelAssembly.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 09/10/21.
//

import Swinject

class ViewModelAssembly: Assembly {
  
  func assemble(container: Container) {
    container.register(SearchUserViewModel.self) { r in
      let viewModel = SearchUserViewModel()
      viewModel.getUserByUsernameUseCase = r.resolve(GetUserByUsernameUseCase.self)
      return viewModel
    }.inObjectScope(.container)
    
    container.register(TweetsViewModel.self) { r in
      let viewModel = TweetsViewModel()
      viewModel.getTweetsByUserIdUseCase = r.resolve(GetTweetsByUserIdUseCase.self)
      viewModel.getSentimentByTextUseCase = r.resolve(GetSentimentByTextUseCase.self)
      return viewModel
    }.inObjectScope(.container)
  }
  
}
