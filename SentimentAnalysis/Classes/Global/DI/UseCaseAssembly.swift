//
//  UseCaseAssembly.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 09/10/21.
//

import Swinject

class UseCaseAssembly: Assembly {
  
  func assemble(container: Container) {
    container.register(GetUserByUsernameUseCase.self) { r in
      GetUserByUsernameUseCase(r.resolve(TwitterRepository.self)!)
    }.inObjectScope(.container)
    
    container.register(GetTweetsByUserIdUseCase.self) { r in
      GetTweetsByUserIdUseCase(r.resolve(TwitterRepository.self)!)
    }.inObjectScope(.container)
    
    container.register(GetSentimentByTextUseCase.self) { r in
      GetSentimentByTextUseCase(r.resolve(GoogleRepository.self)!)
    }.inObjectScope(.container)
  }
  
}
