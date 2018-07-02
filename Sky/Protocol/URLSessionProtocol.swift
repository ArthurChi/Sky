//
//  URLSessionProtocol.swift
//  Sky
//
//  Created by Vassily on 2018/7/1.
//  Copyright © 2018年 Mars. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    
    typealias URLSessionCompletionHandler = (Data?, URLResponse?, Error?) -> Void
    
    func dataTask(with request: URLRequest, completionHandler: URLSessionCompletionHandler) -> URLSessionDataTaskProtocol
}
