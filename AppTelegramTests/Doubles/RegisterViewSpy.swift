//
//  RegisterViewSpy.swift
//  AppTelegramTests
//


import UIKit

final class RegisterViewDelegateSpy: RegisterUserViewDelegate {
    
    var actionRegisterButtonCalledCount: Int = 0
    
    func tappedRegisterButton() {
        actionRegisterButtonCalledCount += 1
    }
}

