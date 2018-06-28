//
//  URL+Extension.swift
//  Sky
//
//  Created by Vassily on 2018/6/28.
//  Copyright © 2018年 Mars. All rights reserved.
//

import Foundation

extension URL {
    static func safeURL(string: String) -> URL {
        guard let validURL = self.init(string: string) else {
            fatalError()
        }
        return validURL
    }
}
