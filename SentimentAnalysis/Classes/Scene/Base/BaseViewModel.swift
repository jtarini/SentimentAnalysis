//
//  BaseViewModel.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 09/10/21.
//

import RxSwift
import RxCocoa

class BaseViewModel {
  
  let disposeBag = DisposeBag()
  
  let _error = BehaviorRelay<Error?>(value: nil)

  var error: Driver<Error?> {
     return _error.asDriver()
  }
  
  func setError(_ error: Error) {
    _error.accept(error)
  }
  
}
