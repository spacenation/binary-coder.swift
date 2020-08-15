import XCTest
import Binary

final class ScaleFactorTests: XCTestCase {
    func testScaleDownFactor() {
        XCTAssert(UInt8(255).scalingDown(factor: 255) == 255)
        XCTAssert(UInt8(255).scalingDown(factor: 127) == 127)
        XCTAssert(UInt8(64).scalingDown(factor: 128) == 32)
        XCTAssert(UInt8(255).scalingDown(factor: 0) == 0)
    }
    
    func testScaleUpFactor() {
        XCTAssert(UInt8(255).scalingUp(factor: 255) == 255)
        XCTAssert(UInt8(127).scalingUp(factor: 127) == 255)
        XCTAssert(UInt8(32).scalingUp(factor: 127) == 64)
        XCTAssert(UInt8(255).scalingUp(factor: 0) == 255)
        XCTAssert(UInt8(0).scalingUp(factor: 0) == 0)
    }

    static var allTests = [
        ("testScaleDownFactor", testScaleDownFactor),
        ("testScaleUpFactor", testScaleUpFactor),
    ]
}
