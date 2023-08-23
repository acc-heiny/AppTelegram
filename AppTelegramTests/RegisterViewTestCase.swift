//
//  RegisterView.swift
//  AppTelegramTests
//


import XCTest
import SnapshotTesting
@testable import AppTelegram

final class RegisterViewTestCase: XCTestCase {
    
    var sut: RegisterView!
    var delegateSpy: RegisterViewDelegateSpy!
    
    override func setUp() {
        super.setUp()
        isRecording = false
        delegateSpy = .init()
        sut = RegisterView(frame: .init(origin: .zero, size: UIScreen.main.bounds.size))
        sut.delegate = delegateSpy 
        
    }
    
    override func tearDown() {
        sut = nil
        delegateSpy = nil
        super.tearDown()
    }
    
    func test_loginView_shouldHaveExpectedlayout() {
        
        if let message = verifySnapshot(matching: sut, as: .image, record: isRecording) {
            XCTFail(message)
            
        }
    }
    
    func test_didTapActionButton_shouldCallDelegate() {
        
        sut.tappedRegisterAccountButton()
        
        XCTAssertEqual(delegateSpy.actionRegisterButtonCalledCount, 1)
    }
}

