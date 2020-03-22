import XCTest

import BinaryTests

var tests = [XCTestCaseEntry]()
tests += BinaryTests.allTests()
tests += Binary+GetTests.allTests()
tests += Binary+ReadTests.allTests()
tests += Binary+WriteTests.allTests()
XCTMain(tests)
