//
//  MockURLSession.swift
//  SkyTests
//
//  Created by 叶果 on 2018/7/3.
//  Copyright © 2018年 Mars. All rights reserved.
//

import Foundation

@testable import Sky

class MockURLSession: URLSessionProtocol {
    
    var data: Data?
    var response: HTTPURLResponse?
    var error: Error?
    
    var sessionDataTask = MockURLSessionDataTask()
    
    func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionProtocol.URLSessionCompletionHandler) -> URLSessionDataTaskProtocol {
        completionHandler(data, response, error)
        return sessionDataTask
    }
}
