//
//  MVVMViewController.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 09/10/21.
//

import UIKit
import RxSwift
import BRYXBanner

protocol MVVMViewControllerProtocol: AnyObject {
    associatedtype T
    
    init(viewModel: T)
}

class BaseViewController<U>: UIViewController, MVVMViewControllerProtocol {
    
  typealias T = U
  let viewModel: T
  let disposeBag = DisposeBag()
  
  convenience init() {
    fatalError("init() has not been implemented")
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  required init(viewModel: T) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  func showError(_ error: Error) {
    let banner = Banner(title: NSLocalizedString("general.error.message", comment: ""), subtitle: "", image: nil, backgroundColor: .red)
    banner.dismissesOnTap = true
    banner.show(duration: 2.0)
  }
  
}
