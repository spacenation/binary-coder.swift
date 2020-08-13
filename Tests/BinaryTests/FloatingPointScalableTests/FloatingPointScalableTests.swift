import XCTest
import Binary

final class FloatingPointScalableTests: XCTestCase {
    func testUnitIntervalscalingForUnsignedIntegers() {
        XCTAssert(UInt8.scaling(floatingPoint: 1.0, in: .unitInterval) == 255)
        XCTAssert(UInt8.scaling(floatingPoint: 0.0, in: .unitInterval) == 0)
        XCTAssert(UInt8.scaling(floatingPoint: 2.0, in: .unitInterval) == 255)
        XCTAssert(UInt8.scaling(floatingPoint: 0.5, in: .unitInterval) == 127)
        
        XCTAssert(UInt16.scaling(floatingPoint: 1.0, in: .unitInterval) == 65535)
        
        let result: UInt16 = %1.0
        XCTAssert(result == 65535)
    }

    static var allTests = [
        ("testUnitIntervalscalingForUnsignedIntegers", testUnitIntervalscalingForUnsignedIntegers),
    ]
}
