//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Juan Esteban Pelaez on 3/01/25.
//

import Combine
import XCTest

@testable import WeatherApp

final class WeatherAppTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
    }
    
    override func tearDown() {
        cancellables = nil
        super.tearDown()
    }
    
    func testURLExtension() {
        let url = URL.concatenateUrl(nil, finalPath: ConstantsMock.endPointLocations)
        XCTAssertNotNil(url)
        
        let url2 = URL.concatenateUrl("test", finalPath: ConstantsMock.endPointLocations)
        XCTAssertNotNil(url2)
        
        let url3 = URL.concatenateUrl("test/", finalPath: "/test2")
        XCTAssertNotNil(url3)
        
        let url4 = URL.concatenateUrl("test/", finalPath: nil)
        XCTAssertNotNil(url4)
    }
    
    func testApiManagerExtension() {
        
        let errorInvalidURL = APIError.invalidURL
        XCTAssertEqual(errorInvalidURL.errorDescription, "Invalid URL")
        
        let errorUnknown = APIError.unknown
        XCTAssertEqual(errorUnknown.errorDescription, "Unknown")
        
        let errorUnexpectedResponse = APIError.unexpectedResponse
        XCTAssertEqual(errorUnexpectedResponse.errorDescription, "Unexpected response from the server")
        
        let errorCode = APIError.httpCode(404)
        XCTAssertEqual(errorCode.errorDescription, "Unexpected HTTP code: 404")
    }
    
}
