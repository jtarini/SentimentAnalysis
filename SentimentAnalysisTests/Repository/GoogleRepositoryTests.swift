//
//  GoogleRepositoryTests.swift
//  SentimentAnalysisTests
//
//  Created by Juliano Tarini on 09/10/21.
//

import XCTest
import RxBlocking
import Moya
@testable import SentimentAnalysis

class GoogleRepositoryTests: XCTestCase {

  var sut: GoogleRepository!

  override func setUp() {
    super.setUp()
    
    let stubbingProvider = MoyaProvider<GoogleApi>(stubClosure: MoyaProvider.immediatelyStub)
    sut = GoogleRepository(stubbingProvider)
  }
  
  override func tearDown() {
    sut = nil
    
    super.tearDown()
  }
  
  func testGetSentimentByTextFound() throws {
    // 1. given
    let text = "Enjoy your vacation!"
    let scoreExpected = 0.9
    
    // 2. when
    let sentiment = try sut.getSentimentByText(text).toBlocking().first()
    
    // 3. then
    XCTAssertEqual(sentiment?.score, scoreExpected)
  }

}
