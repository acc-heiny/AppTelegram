//
//  ContactList.swift
//  AppTelegramTests
//
//

import XCTest
import SnapshotTesting
@testable import AppTelegram

final class ContactListTextCase: XCTestCase {
    
    var sut: ContactListView!

    override func setUp() {
        super.setUp()
        isRecording = false
        sut = ContactListView(frame: .init(origin: .zero, size: UIScreen.main.bounds.size))
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_contactListView_shouldHaveExpectedlayout() {
        
        if let message = verifySnapshot(matching: sut, as: .image, record: isRecording) {
            XCTFail(message)
            
        }
    }
}
