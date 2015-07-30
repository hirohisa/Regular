//
//  UIColor+Hex.swift
//
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

public protocol HexLiteralConvertible {
    func convertToHex() -> Int
}

extension String: HexLiteralConvertible {

    public func convertToHex() -> Int {
        let scanner = NSScanner(string: self)
        var _hexInt : UInt32 = 0
        if scanner.scanHexInt(&_hexInt) {
            return Int(_hexInt)
        }

        return 0
    }
}

extension Int: HexLiteralConvertible {

    public func convertToHex() -> Int {
        return self
    }
}

extension UIColor {

    public convenience init(hex: HexLiteralConvertible) {
        self.init(hex: hex, alpha: 1)
    }

    public convenience init(hex: HexLiteralConvertible, alpha: Float) {

        let RGB = hex.convertToHex()

        let red = CGFloat((RGB >> 16) & 0xff)/0xff
        let green = CGFloat((RGB >> 8) & 0xff)/0xff
        let blue = CGFloat(RGB & 0xff)/0xff

        self.init(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
    }

    public convenience init(gray: HexLiteralConvertible) {
        self.init(gray: gray, alpha: 1)
    }

    public convenience init(gray: HexLiteralConvertible, alpha: Float) {

        let white = CGFloat(gray.convertToHex() & 0xff)/0xff

        self.init(white: white, alpha: CGFloat(alpha))
    }

}