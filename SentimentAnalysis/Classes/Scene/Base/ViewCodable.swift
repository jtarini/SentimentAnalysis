//
//  ViewCodable.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 11/10/21.
//

import Foundation

public protocol ViewCodable {

  func buildHierarchy()

  func setupConstraints()

  func applyAdditionalChanges()
  
}

public extension ViewCodable {

  func setupView() {
    buildHierarchy()
    setupConstraints()
    applyAdditionalChanges()
  }

  func buildHierarchy() {}

  func setupConstraints() {}

  func applyAdditionalChanges() {}
  
}
