import XCTest

import BinaryTests

var tests = [XCTestCaseEntry]()
tests += BinaryTests.allTests()
XCTMain(tests)
