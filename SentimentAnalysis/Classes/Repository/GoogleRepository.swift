//
//  GoogleRepository.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 09/10/21.
//

import RxSwift
import Moya
import Moya_ObjectMapper

class GoogleRepository {
  
  typealias GetSentimentByTextCompletionHandler = Single<Sentiment>
  
  private let api: MoyaProvider<GoogleApi>
  
  init(_ api: MoyaProvider<GoogleApi> = GoogleApiProvider) {
    self.api = api
  }
  
  func getSentimentByText(_ text: String) -> GetSentimentByTextCompletionHandler {
    return api.rx.request(.getSentimentByText(text))
      .mapObject(Sentiment.self, atKeyPath: "documentSentiment")
  }
  
}
