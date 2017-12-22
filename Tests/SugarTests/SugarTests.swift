//
//  SukariTests.swift
//  Neptune
//
//  Created by Chris Karani on 19/12/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import Foundation
import XCTest
@testable import Sukari
import UIKit

struct Message {
    var message: String
    var sendID : Int
}

class SukariTests: XCTestCase {
    
    func testThisExt() {
        let message = Message(message: "Hello Chris", sendID: 23)
        XCTAssertEqual(message.message, "Hello Chris", sendID, 23)
    }
    
}

static var allTests = [
    ("testThisExt", testThisExt),
]
}
