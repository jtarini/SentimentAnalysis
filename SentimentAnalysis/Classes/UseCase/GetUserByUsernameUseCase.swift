//
//  GetUserByUsernameUseCase.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 08/10/21.
//

import RxSwift

class GetUserByUsernameUseCase {
  
  let repository: TwitterRepository
  
  init(_ repository: TwitterRepository) {
    self.repository = repository
  }
  
  func execute(_ username: String) -> Single<User> {
    return repository.getUserByUsername(username)
  }
  
}
