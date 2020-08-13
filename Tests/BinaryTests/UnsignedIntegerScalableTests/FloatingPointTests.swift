import XCTest
import Binary

final class FloatingPointTests: XCTestCase {
    func testScalingUnsignedIntegers() {
        XCTAssert(Float.scaling(integer: UInt8(255)) == 1.0)
        
        let result: Float = %UInt8(255)
        XCTAssert(result == 1.0)
    }

    static var allTests = [
        ("testScalingUnsignedIntegers", testScalingUnsignedIntegers),
    ]
}
