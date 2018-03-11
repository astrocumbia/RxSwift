//
//  LoginViewModel.swift
//  RxExample
//
//  Created by Irvin  Castellanos on 3/10/18.
//  Copyright © 2018 Irvin  Castellanos. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel {
  var username = Variable<String>("")
  var password = Variable<String>("")
  
  var isValid : Observable <Bool> {
    let observable =
      Observable.combineLatest(username.asObservable(),
                               password.asObservable()) { (usernameString, passwordString) in
                                usernameString.count >= 4 && passwordString.count >= 4
    }
    
    return observable
  }
}
