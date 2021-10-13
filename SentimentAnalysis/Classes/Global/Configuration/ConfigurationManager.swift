//
//  ConfigurationManager.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 08/10/21.
//

import Foundation

/**
 Use the Configuration.plist file to provide variables dependent on build configuration.
 An example would be the backend url, where for different build configurations you have different backend urls.
 */
class ConfigurationManager {
  
  enum Configuration: String {
    case debug = "Debug"
    case release = "Release"
  }
  
  // MARK: Properties
  private let configurationKey = "Configuration"
  private let configurationDictionaryName = "Configuration"
  
  let activeConfiguration: Configuration
  private let activeConfigurationDictionary: NSDictionary
  
  // MARK: Lifecycle
  init () {
    let bundle = Bundle(for: ConfigurationManager.self)
    guard let rawConfiguration = bundle.object(forInfoDictionaryKey: configurationKey) as? String,
      let activeConfiguration = Configuration(rawValue: rawConfiguration),
      let configurationDictionaryPath = bundle.path(forResource: configurationDictionaryName, ofType: "plist"),
      let configurationDictionary = NSDictionary(contentsOfFile: configurationDictionaryPath),
      let activeEnvironmentDictionary = configurationDictionary[activeConfiguration.rawValue] as? NSDictionary
      else {
        fatalError("Configuration Error")
        
    }
    self.activeConfiguration = activeConfiguration
    self.activeConfigurationDictionary = activeEnvironmentDictionary
  }
  
  // MARK: Methods
  func getActiveVariableValue<V>(forKey key: String) -> V {
    guard let value = activeConfigurationDictionary[key] as?  V else {
      fatalError("No value satysfying requirements")
    }
    return value
  }
  
  func isRunning(in configuration: Configuration) -> Bool {
    return activeConfiguration == configuration
  }
  
}
