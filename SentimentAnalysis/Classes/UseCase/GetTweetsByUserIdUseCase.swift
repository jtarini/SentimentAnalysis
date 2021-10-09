//
//  GetTweetsByUserIdUseCase.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 09/10/21.
//

import RxSwift

class GetTweetsByUserIdUseCase {
  
  let repository: TwitterRepository
  
  init(_ repository: TwitterRepository) {
    self.repository = repository
  }
  
  func execute(_ userId: String) -> Single<[Tweet]> {
    return repository.getTweetsByUserId(userId)
  }
  
}
