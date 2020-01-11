//
//  LoginViewController.swift
//  MobileCI
//
//  Created by Domonkos Pal
//  Copyright © 2019. Domonkos Pal. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Fabric
import Crashlytics

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var responseLabel: UILabel!
    
    @IBOutlet weak var crashLabel: UILabel!
    
    var viewModel: LoginViewModelType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.rx.text
            .orEmpty
            .bind(to: viewModel.username)
            .disposed(by: rx.disposeBag)
        
        passwordTextField.rx.text
            .orEmpty
            .bind(to: viewModel.password)
            .disposed(by: rx.disposeBag)
        
        loginButton.rx.action = viewModel.loginAction()
        
        let longTapGesture = UILongPressGestureRecognizer()
        longTapGesture.minimumPressDuration = 1.0
        longTapGesture.rx.event.bind(onNext: { _ in
            Crashlytics.sharedInstance().crash()
        }).disposed(by: rx.disposeBag)
        crashLabel.isUserInteractionEnabled = true
        crashLabel.addGestureRecognizer(longTapGesture)
        
        viewModel.result
            .bind(to: responseLabel.rx.text)
            .disposed(by: rx.disposeBag)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
