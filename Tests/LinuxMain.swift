import XCTest

import BinaryTests

var tests = [XCTestCaseEntry]()
tests += BinaryTests.allTests()
tests += BinaryGetTests.allTests()
tests += BinaryReadTests.allTests()
tests += BinaryWriteTests.allTests()
XCTMain(tests)
