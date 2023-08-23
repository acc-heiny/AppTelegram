//
//  ContactListDataSourceTestCase.swift
//  AppTelegramTests
//
//

import XCTest
@testable import AppTelegram

final class DataUserModelTestCase: XCTestCase {
    
    var sut: DataUser!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    
    func test_init_shouldSetCorrectAttributes() {
        
        let name = "Felipe"
        let image = "menino1"
        
        let user = DataUser(name: name, image: image)
        
        XCTAssertEqual(user.name, name)
        XCTAssertEqual(user.image, image)
    }
    
    func test_encodingAndDecoding_shouldPreserveData() {
        
        let name = "Gabriela"
        let image = "menina"
        
        let user = DataUser(name: name, image: image)
        
        let encoder = JSONEncoder()
        guard let encodedData = try? encoder.encode(user) else {
            XCTFail("Failed to encode DataUser")
            return
        }
        
        let decoder = JSONDecoder()
        guard let decodedUser = try? decoder.decode(DataUser.self, from: encodedData) else {
            XCTFail("Failed to decode DataUser")
            return
        }
        
        XCTAssertEqual(decodedUser.name, name)
        XCTAssertEqual(decodedUser.image, image)
    }
}



