//
//  WeatherDataManagerTest.swift
//  SkyTests
//
//  Created by 叶果 on 2018/7/3.
//  Copyright © 2018年 Mars. All rights reserved.
//

import XCTest

@testable import Sky

class WeatherDataManagerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_urlession_datatask_resume_is_called() {
        
        let session = MockURLSession()
        let task = session.sessionDataTask
        
        let weatherDataManager = WeatherDataManager.init(baseURL: API.authenticatedUrl, urlSession: session)
        
        weatherDataManager.weatherData(at: 0, longtitude: 0) { (_, _) in }
        
        XCTAssert(task.isResumeCalled)
    }
    
    func test_weatherData_get_failedRequest() {
        let session = MockURLSession()
        session.error = NSError(domain: "Invalid Request", code: 100, userInfo: nil)
        
        let manager = WeatherDataManager(baseURL: URL(string: "https://darksky.net")!, urlSession: session)
        
        var error: DataManagerError?
        manager.weatherData(at: 0, longtitude: 0) { (_, e) in
            error = e
        }
        
        XCTAssertEqual(error, DataManagerError.failedRequest)
    }
    
    func test_weatherDataAt_handle_statuscode_not_equal_to_200() {
        let url = URL(string: "https://darksky.net")!
        let session = MockURLSession()
        session.response = HTTPURLResponse(url: url, statusCode: 400, httpVersion: nil, headerFields: nil)
        
        session.data = "{}".data(using: .utf8)
        
        let manager = WeatherDataManager(baseURL: url, urlSession: session)
        
        var error: DataManagerError?
        manager.weatherData(at: 0, longtitude: 0) { (_, e) in
            error = e
        }
        
        XCTAssertEqual(error, DataManagerError.invalidResponse)
    }
}
