//
//  TwitterApi.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 08/10/21.
//

import Moya

let TwitterApiProvider = MoyaProvider<TwitterApi>()

enum TwitterApi {
  
  case getUserByUsername(_ username: String)
  case getTweetsByUserId(_ userId: String)
  
}

extension TwitterApi: Moya.TargetType {
  
  var baseURL: URL {
    return URL(string: Configs.shared.getTwitterApiUrl())!
  }
  
  var path: String {
    switch self {
      case .getUserByUsername(let username):
        return "/2/users/by/username/\(username)"
      case .getTweetsByUserId(let userId):
        return "/2/users/\(userId)/tweets"
    }
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var task: Moya.Task {
    return .requestPlain
  }
  
  var headers: [String: String]? {
    return [
      "Content-type": "application/json",
      "Authorization": "Bearer \(Configs.shared.getTwitterApiBearerToken())"
    ]
  }
  
  var sampleData: Data {
    switch self {
      case .getUserByUsername(_): return stubbedResponse("getUserByUsername")
      case .getTweetsByUserId(_): return stubbedResponse("getTweetsByUserId")
    }
  }
  
}

func stubbedResponse(_ fileName: String) -> Data! {
  @objc class TestClass: NSObject { }
  let bundle = Bundle(for: TestClass.self)
  let path = bundle.path(forResource: fileName, ofType: "json")
  
  return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
}
