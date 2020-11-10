//
//  TechtestTests.swift
//  TechtestTests
//
//  Created by Ankita on 10/11/20.
//  Copyright © 2020 Ankita. All rights reserved.
//

import XCTest
@testable import Techtest

class TechtestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testviewCntroller() {
        let controller = ViewController()
        controller.fields = RowFieldConfiguration().getallFieldlinkedUp(rows: [["title":"Beavers","description":"Beavers are second only to humans","imageHref":"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"]])
        XCTAssertNotNil(controller, "view controller instance was successfully created")
    }

}
