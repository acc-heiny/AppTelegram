
import Foundation
import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    var authenticationUserRegister: Auth?
    var registerUserView: RegisterView = RegisterView()
    
    override func loadView() {
        self.view = registerUserView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerUserView.delegate = self
        registerUserView.configTextFieldDelegate(delegate: self)
        authenticationUserRegister = Auth.auth()
    }
    
    func alertRegisterSuccess() {
        DispatchQueue.main.async {
             let alert: UIAlertController = UIAlertController(title: "Welcome", message: "Your registration was successful!", preferredStyle: .alert)
            let alertAction: UIAlertAction = UIAlertAction(title: "Log in", style: .default)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        registerUserView.validationTextFields()
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        return textField.resignFirstResponder()
    }
}

extension RegisterViewController: RegisterUserViewDelegate {
    func tappedRegisterButton() {
        
        let register = registerUserView
        
        authenticationUserRegister?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { (result, error) in
            
            if error != nil {
                print("Error ao cadastrar")
                
            } else {
                self.alertRegisterSuccess()
                
            }
            
        })
    }
}
