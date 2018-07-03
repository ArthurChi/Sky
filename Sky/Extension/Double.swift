//
//  Double.swift
//  Sky
//
//  Created by Vassily on 2018/7/3.
//  Copyright © 2018年 Mars. All rights reserved.
//

import Foundation

extension Double {
    func toCelcius() -> Double {
        return (self - 32.0) / 1.8
    }
}
