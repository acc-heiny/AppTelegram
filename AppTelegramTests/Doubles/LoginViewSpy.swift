//
//  LoginViewSpy.swift
//  AppTelegramTests

import UIKit

final class LoginViewDelegateSpy: LoginViewDelegate {
    
    var actionLoginButtonCalledCount: Int = 0
    var actionRegisterButtonCalledCount: Int = 0
    
    func actionLoginButton() {
        actionLoginButtonCalledCount += 1
    }
    
    func actionRegisterButton() {
        actionRegisterButtonCalledCount += 1
        
    }
}
