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
        
        let location = Location(name: "", latitude: 0, longtitude: 0)
        weatherDataManager.weatherData(at: location) { (_, _) in }
        
        XCTAssert(task.isResumeCalled)
    }
    
}
