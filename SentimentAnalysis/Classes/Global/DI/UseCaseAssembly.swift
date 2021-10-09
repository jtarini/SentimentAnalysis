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
  }
  
}
