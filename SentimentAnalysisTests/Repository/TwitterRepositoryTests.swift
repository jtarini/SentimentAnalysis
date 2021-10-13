//
//  TwitterRepositoryTests.swift
//  SentimentAnalysisTests
//
//  Created by Juliano Tarini on 09/10/21.
//

import XCTest
import RxBlocking
import Moya
@testable import SentimentAnalysis

class TwitterRepositoryTests: XCTestCase {

  var sut: TwitterRepository!

  override func setUp() {
    super.setUp()
    
    let stubbingProvider = MoyaProvider<TwitterApi>(stubClosure: MoyaProvider.immediatelyStub)
    sut = TwitterRepository(stubbingProvider)
  }
  
  override func tearDown() {
    sut = nil
    
    super.tearDown()
  }
  
  func testGetUserByUsernameFound() throws {
    // 1. given
    let username = "maurocezar"
    let userIdExpected = "55069015"
    
    // 2. when
    let user = try sut.getUserByUsername(username).toBlocking().first()
    
    // 3. then
    XCTAssertEqual(user?.id, userIdExpected)
  }
  
  func testGetTweetsByUserIdNotEmpty() throws {
    // 1. given
    let userId = "55069015"
    
    // 2. when
    let tweets = try sut.getTweetsByUserId(userId).toBlocking().toArray()
    
    // 3. then
    XCTAssertTrue(!tweets.isEmpty)
  }

}
