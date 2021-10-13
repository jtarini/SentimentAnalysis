//
//  TwitterRepository.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 08/10/21.
//

import RxSwift
import Moya
import Moya_ObjectMapper

class TwitterRepository {
  
  typealias GetUserByUsernameCompletionHandler = Single<User>
  typealias GetTweetsByUserIdCompletionHandler = Single<[Tweet]>
  
  private let api: MoyaProvider<TwitterApi>
  
  init(_ api: MoyaProvider<TwitterApi> = TwitterApiProvider) {
    self.api = api
  }
  
  func getUserByUsername(_ username: String) -> GetUserByUsernameCompletionHandler {
    return api.rx.request(.getUserByUsername(username))
      .mapObject(User.self, atKeyPath: "data")
  }
  
  func getTweetsByUserId(_ userId: String) -> GetTweetsByUserIdCompletionHandler {
    return api.rx.request(.getTweetsByUserId(userId))
      .mapArray(Tweet.self, atKeyPath: "data")
  }
  
}
