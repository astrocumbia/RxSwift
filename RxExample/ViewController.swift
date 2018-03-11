//
//  ViewController.swift
//  RxExample
//
//  Created by Irvin  Castellanos on 3/10/18.
//  Copyright © 2018 Irvin  Castellanos. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
  let MAIN_COLOR = UIColor.init(red: 70,
                                green: 190,
                                blue: 167,
                                alpha: 1)

  @IBOutlet weak var usernameTxtField: UITextField!
  @IBOutlet weak var passwordTxtField: UITextField!
  @IBOutlet weak var loginBtn: UIButton!
  @IBOutlet weak var stateLabel: UILabel!
  
  var loginViewModel = LoginViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    _ = usernameTxtField.rx.text.map { $0 ?? "" }
        .bind(to: loginViewModel.username)
    
    _ = passwordTxtField.rx.text.map { $0 ?? "" }
        .bind(to: loginViewModel.password)
    
    _ = loginViewModel.isValid
        .bind(to: loginBtn.rx.isEnabled)
    
    _ = loginViewModel.isValid.subscribe(onNext: {[unowned self] isValid in
      self.stateLabelState(isValid)
      self.logginBtnState(isValid)
    })
    
    
  }
  
  func logginBtnState(_ isEnabled: Bool = true) {
    loginBtn.isEnabled = isEnabled
    self.loginBtn.backgroundColor = isEnabled ? UIColor.orange
      :UIColor.lightGray
  }
  
  func stateLabelState(_ isEnabled: Bool = true) {
    stateLabel.text = isEnabled ? "Enabled" : "Disabled"
    stateLabel.textColor = isEnabled ? .green : .red
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

