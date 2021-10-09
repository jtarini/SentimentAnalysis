//
//  GetUserByUsernameUseCaseTests.swift
//  SentimentAnalysisTests
//
//  Created by Juliano Tarini on 09/10/21.
//

import XCTest
import RxBlocking
import Moya
@testable import SentimentAnalysis

class GetUserByUsernameUseCaseTests: XCTestCase {

  var sut: GetUserByUsernameUseCase!

  override func setUp() {
    super.setUp()
    
    let stubbingProvider = MoyaProvider<TwitterApi>(stubClosure: MoyaProvider.immediatelyStub)
    let repository = TwitterRepository(stubbingProvider)
    
    sut = GetUserByUsernameUseCase(repository)
  }
  
  override func tearDown() {
    sut = nil
    
    super.tearDown()
  }
  
  func testExecute() throws {
    // 1. given
    let username = "maurocezar"
    let userIdExpected = "55069015"
    
    // 2. when
    let user = try sut.execute(username).toBlocking().first()
    
    // 3. then
    XCTAssertEqual(user?.id, userIdExpected)
  }

}
