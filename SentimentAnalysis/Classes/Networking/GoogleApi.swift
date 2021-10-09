//
//  GoogleApi.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 09/10/21.
//

import Moya

let GoogleApiProvider = MoyaProvider<GoogleApi>()

enum GoogleApi {
  
  case getSentimentByText(_ text: String)
  
}

extension GoogleApi: Moya.TargetType {
  
  var baseURL: URL {
    return URL(string: Configs.shared.getGoogleCloudApiUrl())!
  }
  
  var path: String {
    switch self {
      case .getSentimentByText:
      return "/v1beta2/documents:analyzeSentiment"
    }
  }
  
  var method: Moya.Method {
    return .post
  }
  
  var task: Moya.Task {
    switch self {
      case let .getSentimentByText(text):
        return .requestCompositeParameters(bodyParameters: ["encodingType": "UTF8", "document": ["type": "PLAIN_TEXT", "content": text]], bodyEncoding: JSONEncoding.default, urlParameters: [ "key": Configs.shared.getGoogleCloudApiKey()])
      }
  }
  
  var headers: [String: String]? {
    return [
      "Content-type": "application/json"
    ]
  }
  
  var sampleData: Data {
    switch self {
      case .getSentimentByText(_): return stubbedResponse("getSentimentByText")
    }
  }
  
}
