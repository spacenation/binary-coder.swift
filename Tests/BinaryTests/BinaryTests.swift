import XCTest
@testable import Binary

final class BinaryTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Binary().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
