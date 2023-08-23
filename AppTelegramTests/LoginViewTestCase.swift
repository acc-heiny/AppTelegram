import XCTest
import SnapshotTesting
@testable import AppTelegram

final class LoginViewTestCase: XCTestCase {
    
    var sut: LoginView!
    var delegateSpy: LoginViewDelegateSpy!
    
    override func setUp() {
        super.setUp()
        isRecording = false
        delegateSpy = .init()
        sut = LoginView(frame: .init(origin: .zero, size: UIScreen.main.bounds.size))
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
        
        sut.tappedloginAcountButton()
        sut.tappedRegisterAccountButton()
        
        XCTAssertEqual(delegateSpy.actionLoginButtonCalledCount, 1)
        XCTAssertEqual(delegateSpy.actionRegisterButtonCalledCount, 1)
    }
}
