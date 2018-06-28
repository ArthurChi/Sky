//
//  Configuration.swift
//  Sky
//
//  Created by Vassily on 2018/6/28.
//  Copyright © 2018年 Mars. All rights reserved.
//

import Foundation

struct API {
    static let key = "867ecdad4ad5932b5afe631c1010243e"
    static let baseURL: URL = URL(string: "https://api.darksky.net/forecast")!
    static let authenticatedUrl = baseURL.appendingPathComponent(key)
}
