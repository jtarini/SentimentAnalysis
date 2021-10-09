//
//  GetSentimentByTextUseCase.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 09/10/21.
//

import RxSwift

class GetSentimentByTextUseCase {
  
  let repository: GoogleRepository
  
  private let SadSentimentType = "sad"
  private let NeutralSentimentType = "neutral"
  private let HappySentimentType = "happy"
  
  init(_ repository: GoogleRepository) {
    self.repository = repository
  }
  
  func execute(_ text: String) -> Single<Sentiment> {
    return Single<Sentiment>.create { singleSentiment in
      self.repository.getSentimentByText(text)
        .subscribe { event in
          switch event {
            case .success(let sentiment):
              var sentimentType = self.NeutralSentimentType
              if sentiment.score >= 0.7 && sentiment.score <= 1.0 {
                sentimentType = self.HappySentimentType
              }
              
              if sentiment.score >= 0.0 && sentiment.score <= 0.3 {
                sentimentType = self.SadSentimentType
              }
              
              sentiment.sentimentType = sentimentType
              singleSentiment(.success(sentiment))
            case .error(let error):
              singleSentiment(.error(error))
          }
        }
      }
  }
  
}
