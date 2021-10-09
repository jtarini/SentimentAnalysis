//
//  Sentiment.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 08/10/21.
//

import ObjectMapper

class Sentiment: Mappable {
  
  var score = 0.0
  
  required convenience init?(map: Map) {
    self.init()
  }
  
  func mapping(map: Map) {
    score <- map["score"]
  }
  
}
