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
  
  func testExecute() throws {
    // 1. given
    let text = "Enjoy your vacation!"
    let scoreExpected = 0.9
    
    // 2. when
    let sentiment = try sut.execute(text).toBlocking().first()
    
    // 3. then
    XCTAssertEqual(sentiment?.score, scoreExpected)
  }

}
