//
//  Configs.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 08/10/21.
//

class Configs: ConfigurationManager {

  // MARK: Shared instance
  
  static let shared = Configs()
  
  // MARK: Properties
  
  private let TwitterApiUrl = "TwitterApiUrl"
  private let TwitterApiBearerToken = "TwitterApiBearerToken"
  private let GoogleCloudApiUrl = "GoogleCloudApiUrl"
  private let GoogleCloudApiKey = "GoogleCloudApiKey"
  
  // MARK: Public functions
  
  func getTwitterApiUrl() -> String {
    return getActiveVariableValue(forKey: TwitterApiUrl)
  }
  
  func getTwitterApiBearerToken() -> String {
    return getActiveVariableValue(forKey: TwitterApiBearerToken)
  }
  
  func getGoogleCloudApiUrl() -> String {
    return getActiveVariableValue(forKey: GoogleCloudApiUrl)
  }
  
  func getGoogleCloudApiKey() -> String {
    return getActiveVariableValue(forKey: GoogleCloudApiKey)
  }
  
}
