//
//  Tweet.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 08/10/21.
//

import ObjectMapper

class Tweet: Mappable {
  
  var id = ""
  var text = ""
  
  required convenience init?(map: Map) {
    self.init()
  }
  
  func mapping(map: Map) {
    id <- map["id"]
    text <- map["text"]
  }
  
}
