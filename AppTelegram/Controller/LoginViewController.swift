//
//  LoginViewController.swift
//  LoginScreen
//
//  Created by hellen.heiny.f.santi on 06/04/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var loginUserAuthentication: Auth?
    var loginView: LoginView = LoginView()
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView.configTextFieldDelegate(delegate: self)
        loginView.delegate = self
        loginUserAuthentication = Auth.auth()
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        loginView.validationTextFields()
        print("textFieldDidEndEditing")
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        return textField.resignFirstResponder()
    }
}
extension LoginViewController: LoginViewDelegate {
    
    func actionLoginButton() {
        let login = loginView
        
        loginUserAuthentication?.signIn(withEmail: login.getEmail() , password: login.getPassword(), completion: { (usuario, error) in
            
            if error != nil {
                print("Atenção dados incorretos, verifique e tente novamente!")
                
            } else {
                
                print("Usuario logado com sucesso!")
                
            }
        })
        
        let contactListViewController = ContactListViewController()
        navigationController?.pushViewController(contactListViewController, animated: true)
        
    }
    
    func actionRegisterButton() {
        let registerUserViewController = RegisterViewController()
        navigationController?.pushViewController(registerUserViewController, animated: true)
    }
}
