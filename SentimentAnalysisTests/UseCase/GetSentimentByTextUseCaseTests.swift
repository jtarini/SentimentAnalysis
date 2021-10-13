//
//  GetSentimentByTextUseCaseTests.swift
//  SentimentAnalysisTests
//
//  Created by Juliano Tarini on 09/10/21.
//

import XCTest
import RxBlocking
import Moya
@testable import SentimentAnalysis

class GetSentimentByTextUseCaseTests: XCTestCase {

  var sut: GetSentimentByTextUseCase!

  override func setUp() {
    super.setUp()
    
    let stubbingProvider = MoyaProvider<GoogleApi>(stubClosure: MoyaProvider.immediatelyStub)
    let repository = GoogleRepository(stubbingProvider)
    
    sut = GetSentimentByTextUseCase(repository)
  }
  
  override func tearDown() {
    sut = nil
    
    super.tearDown()
  }
  
  func testExecuteForHappySentimentType() throws {
    // 1. given
    let text = "Enjoy your vacation!"
    let sentimentTypeExpected = "happy"
    
    // 2. when
    let sentiment = try sut.execute(text).toBlocking().first()
    
    // 3. then
    XCTAssertEqual(sentiment?.sentimentType, sentimentTypeExpected)
  }
  
  func testExecuteForNeutralSentimentType() throws {
    // 1. given
    let text = "Enjoy your vacation!"
    let sentimentTypeExpected = "neutral"
    
    // 2. when
    let sentiment = try sut.execute(text).toBlocking().first()
    
    // 3. then
    XCTAssertNotEqual(sentiment?.sentimentType, sentimentTypeExpected)
  }
  
  func testExecuteForSadSentimentType() throws {
    // 1. given
    let text = "Enjoy your vacation!"
    let sentimentTypeExpected = "sad"
    
    // 2. when
    let sentiment = try sut.execute(text).toBlocking().first()
    
    // 3. then
    XCTAssertNotEqual(sentiment?.sentimentType, sentimentTypeExpected)
  }

}
