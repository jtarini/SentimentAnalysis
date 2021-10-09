//
//  User.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 08/10/21.
//

import ObjectMapper

class User: Mappable {
  
  var id = ""
  var name = ""
  var username = ""
  
  required convenience init?(map: Map) {
    self.init()
  }
  
  func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    username <- map["username"]
  }
  
}
