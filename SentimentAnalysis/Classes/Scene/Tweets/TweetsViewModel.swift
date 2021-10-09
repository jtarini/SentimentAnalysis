//
//  TweetsViewModel.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 09/10/21.
//

import RxCocoa
import Moya

class TweetsViewModel: BaseViewModel {
  
  var getTweetsByUserIdUseCase: GetTweetsByUserIdUseCase!
  var getSentimentByTextUseCase: GetSentimentByTextUseCase!
  
  private let _tweets = BehaviorRelay<[Tweet]>(value: [])
  private let _sentiment = BehaviorRelay<Sentiment?>(value: nil)
  
  var tweets: Driver<[Tweet]> {
    return _tweets.asDriver()
  }
  
  var sentiment: Driver<Sentiment?> {
    return _sentiment.asDriver()
  }
  
  func searchTweetsByUserId(_ userId: String) {
    getTweetsByUserIdUseCase.execute(userId)
      .subscribe { event in
        switch event {
          case .success(let tweets):
            self._tweets.accept(tweets)
            self._error.accept(nil)
          case .error(let error):
            self.setError(error)
        }
      }
      .disposed(by: disposeBag)
  }
  
  func getSentimentByText(_ text: String) {
    getSentimentByTextUseCase.execute(text)
      .subscribe { event in
        switch event {
          case .success(let sentiment):
            self._sentiment.accept(sentiment)
            self._error.accept(nil)
          case .error(let error):
            self.setError(error)
        }
      }
      .disposed(by: disposeBag)
  }
  
}
