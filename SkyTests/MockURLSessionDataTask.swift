//
//  MockURLSessionDataTask.swift
//  SkyTests
//
//  Created by 叶果 on 2018/7/3.
//  Copyright © 2018年 Mars. All rights reserved.
//

import Foundation

@testable import Sky

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    
    private(set) var isResumeCalled: Bool = false
    
    func resume() {
        isResumeCalled = true
    }
}
