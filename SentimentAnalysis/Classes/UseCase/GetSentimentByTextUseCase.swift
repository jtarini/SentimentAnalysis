//
//  GetSentimentByTextUseCase.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 09/10/21.
//

import RxSwift

class GetSentimentByTextUseCase {
  
  let repository: GoogleRepository
  
  init(_ repository: GoogleRepository) {
    self.repository = repository
  }
  
  func execute(_ text: String) -> Single<Sentiment> {
    return repository.getSentimentByText(text)
  }
  
}
