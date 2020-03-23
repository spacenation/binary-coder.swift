import XCTest
import Binary

final class BinaryTests: XCTestCase {
    func testEquatable() {
        XCTAssertEqual(Binary(bytes: [0b0000_00001]), Binary(bytes: [1]))
    }
    
    func testBytes() {
        XCTAssertEqual(withUnsafeBytes(of: Data([0b0000_0000, 0b1111_0000])) {
            $0.baseAddress!.assumingMemoryBound(to: UInt16.self).pointee
        }, 61440)
        
        XCTAssertEqual(withUnsafeBytes(of: Data([0b1111_1111, 0b0000_0000])) {
            $0.baseAddress!.assumingMemoryBound(to: Data.self).pointee
        }, Data([0b1111_1111, 0b0000_0000]))
    }

    static var allTests = [
        ("testEquatable", testEquatable),
    ]
}
