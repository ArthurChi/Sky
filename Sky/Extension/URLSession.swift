//
//  URLSession.swift
//  Sky
//
//  Created by 叶果 on 2018/7/3.
//  Copyright © 2018年 Mars. All rights reserved.
//

import Foundation

extension URLSession: URLSessionProtocol {
    
    func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionCompletionHandler) -> URLSessionDataTaskProtocol {
        return dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask
    }
}
