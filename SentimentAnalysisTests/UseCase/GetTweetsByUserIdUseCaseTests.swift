//
//  GetTweetsByUserIdUseCaseTests.swift
//  SentimentAnalysisTests
//
//  Created by Juliano Tarini on 09/10/21.
//

import XCTest
import RxBlocking
import Moya
@testable import SentimentAnalysis

class GetTweetsByUserIdUseCaseTests: XCTestCase {

  var sut: GetTweetsByUserIdUseCase!

  override func setUp() {
    super.setUp()
    
    let stubbingProvider = MoyaProvider<TwitterApi>(stubClosure: MoyaProvider.immediatelyStub)
    let repository = TwitterRepository(stubbingProvider)
    
    sut = GetTweetsByUserIdUseCase(repository)
  }
  
  override func tearDown() {
    sut = nil
    
    super.tearDown()
  }
  
  func testExecute() throws {
    // 1. given
    let userId = "55069015"
    
    // 2. when
    let tweets = try sut.repository.getTweetsByUserId(userId).toBlocking().toArray()
    
    // 3. then
    XCTAssertTrue(!tweets.isEmpty)
  }

}
