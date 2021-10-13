//
//  AppDelegate.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 08/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  private var coordinator: ApplicationCoordinator!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    coordinator = ApplicationCoordinator()
    coordinator.start()

    return true
  }

}
