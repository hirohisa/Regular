//
//  RegularTests.swift
//  RegularTests
//
//  Created by Hirohisa Kawasaki on 7/30/15.
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//

import UIKit
import XCTest
import Regular

class RegularTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testColorHex() {
        var result: UIColor!
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0

        result = UIColor(hex: 0xffffff)
        result.getRed(&red, green: &green, blue: &blue, alpha: nil)
        XCTAssertEqual(red, 1, "red element is failed.")
        XCTAssertEqual(green, 1, "green element is failed.")
        XCTAssertEqual(blue, 1, "blue element is failed.")

        result = UIColor(hex: 0x00ff00)
        result.getRed(&red, green: &green, blue: &blue, alpha: nil)
        XCTAssertEqual(red, 0, "red element is failed.")
        XCTAssertEqual(green, 1, "green element is failed.")
        XCTAssertEqual(blue, 0, "blue element is failed.")

    }

    func testColorGray() {
        var result: UIColor!
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0

        result = UIColor(gray: 0xff)
        result.getRed(&red, green: &green, blue: &blue, alpha: nil)
        XCTAssertEqual(red, 1, "red element is failed.")
        XCTAssertEqual(green, 1, "green element is failed.")
        XCTAssertEqual(blue, 1, "blue element is failed.")

        result = UIColor(gray: 0x01)
        result.getRed(&red, green: &green, blue: &blue, alpha: nil)
        XCTAssertEqual(red, 1/0xff, "red element is failed.")
        XCTAssertEqual(green, 1/0xff, "green element is failed.")
        XCTAssertEqual(blue, 1/0xff, "blue element is failed.")

    }

}
