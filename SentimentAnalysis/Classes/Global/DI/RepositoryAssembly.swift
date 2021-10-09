//
//  RepositoryAssembly.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 09/10/21.
//

import Swinject

class RepositoryAssembly: Assembly {
  
  func assemble(container: Container) {
    container.register(TwitterRepository.self) { _ in TwitterRepository() }
      .inObjectScope(.container)
  }
  
}
