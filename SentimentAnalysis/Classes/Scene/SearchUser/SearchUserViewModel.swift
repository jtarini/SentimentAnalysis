//
//  SearchUserViewModel.swift
//  SentimentAnalysis
//
//  Created by Juliano Tarini on 08/10/21.
//

import RxCocoa
import Moya

class SearchUserViewModel: BaseViewModel {
  
  var getUserByUsernameUseCase: GetUserByUsernameUseCase!
  var coordinator: MainCoordinator!
  
  private let _user = BehaviorRelay<User?>(value: nil)
  private let _userNotFound = BehaviorRelay<Bool>(value: false)
  
  var user: Driver<User?> {
    return _user.asDriver()
  }
  
  var userNotFound: Driver<Bool> {
     return _userNotFound.asDriver()
  }
  
  func searchUserByUsername(_ username: String) {
    getUserByUsernameUseCase.execute(username)
      .subscribe { event in
        switch event {
          case .success(let user):
            self._user.accept(user)
            self._error.accept(nil)
          case .error(let error):
            let moyaError: MoyaError? = error as? MoyaError
            let response: Response? = moyaError?.response
            let statusCode: Int? = response?.statusCode
            if statusCode == 200 {
              self._userNotFound.accept(true)
            }
            else {
              self.setError(error)
            }
        }
      }
      .disposed(by: disposeBag)
  }
  
}
