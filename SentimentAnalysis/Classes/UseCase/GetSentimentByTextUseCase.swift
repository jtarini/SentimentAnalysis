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
  private let SadSentimentTypeMinValue = 0.0
  private let SadSentimentTypeMaxValue = 0.3
  private let NeutralSentimentTypeMinValue = 0.31
  private let NeutralSentimentTypeMaxValue = 0.7
  private let HappySentimentTypeMinValue = 0.71
  private let HappySentimentTypeMaxValue = 1.0
  
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
              if sentiment.score >= self.HappySentimentTypeMinValue && sentiment.score <= self.HappySentimentTypeMaxValue {
                sentimentType = self.HappySentimentType
              }
              else if sentiment.score >= self.NeutralSentimentTypeMinValue && sentiment.score <= self.NeutralSentimentTypeMaxValue {
                sentimentType = self.NeutralSentimentType
              }
              else if sentiment.score >= self.SadSentimentTypeMinValue && sentiment.score <= self.SadSentimentTypeMaxValue {
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
