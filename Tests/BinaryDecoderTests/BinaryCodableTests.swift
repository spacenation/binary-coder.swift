import XCTest
import BinaryDecoder

final class BinaryCodableTests: XCTestCase {
    func testBinaryDecodable() {
        XCTAssertEqual(try? BinaryDecoder.decode(UInt8.self, from: [0b0000_1111]), 15)
        XCTAssertEqual(try? BinaryDecoder.decode(UInt16.self, from: [0b0000_0000, 0b1111_0000]), 61440)
        XCTAssertEqual(try? BinaryDecoder.decode(Data.self, size: 16, from: [0b1111_0000, 0b0000_0000]), Data([0b1111_0000, 0b0000_0000]))
            XCTAssertEqual(
            String(data: try! BinaryDecoder.decode(Data.self, size: 6 * .byte, from: [66, 105, 110, 97, 114, 121]), encoding: .utf8),
            "Binary"
        )
    }
    
    func testBinaryEncodable() {
        XCTAssertEqual(BinaryEncoder.encode(UInt8(15)),[0b0000_1111])
        XCTAssertEqual(BinaryEncoder.encode(UInt16(61440).bigEndian), [0b1111_0000, 0b0000_0000])
        XCTAssertEqual(BinaryEncoder.encode(Data([0b1111_0000, 0b0000_0000]), size: 16), [0b1111_0000, 0b0000_0000])
    
        XCTAssertEqual(
            Data(BinaryEncoder.encode("Binary".data(using: .utf8), size: 6 * .byte)),
            Data([66, 105, 110, 97, 114, 121])
        )
    }
    
    func testBinaryDecodableImplementation() {
        XCTAssertEqual(
            try? BinaryDecoder.decode(Message<DeliveryFlags>.self, from: [0b0000_1111, 0b1111_1111, 0b0000_0011]),
            Message(source: 15, data: Data([0b1111_1111]), flags: DeliveryFlags(isDelivered: true, isRead: true))
        )
    }
    
    func testBinaryEncodableImplementation() {
        XCTAssertEqual(
            try? BinaryEncoder.encode(Message(source: 15, data: Data([0b1111_1111]), flags: DeliveryFlags(isDelivered: true, isRead: true))),
            [0b0000_1111, 0b1111_1111, 0b0000_0011]
        )
    }
    
    static var allTests = [
        ("testBinaryEncodable", testBinaryEncodable),
        ("testBinaryDecodable", testBinaryDecodable),
        ("testBinaryDecodableImplementation", testBinaryDecodableImplementation),
        ("testBinaryEncodableImplementation", testBinaryEncodableImplementation),
    ]
}

private struct Message<Flags: Equatable & BinaryCodable>: Equatable, BinaryCodable {
    let source: UInt8
    let data: Data
    let flags: Flags
    
    init(source: UInt8, data: Data, flags: Flags) {
        self.source = source
        self.data = data
        self.flags = flags
    }
    
    init(from decoder: BinaryDecoder) throws {
        source = try decoder.decode()
        data = try decoder.decode(size: .byte)
        try decoder.skip(size: 6)
        flags = try decoder.decode()
    }
    
    func encode(to encoder: BinaryEncoder) throws {
        encoder.encode(source)
        encoder.encode(data, size: .byte)
        encoder.encodeEmpty(size: 6)
        try encoder.encode(flags)
    }
}

public struct DeliveryFlags: Equatable, BinaryCodable {
    let isDelivered: Bool
    let isRead: Bool
    
    public init(isDelivered: Bool, isRead: Bool) {
        self.isDelivered = isDelivered
        self.isRead = isRead
    }
    
    public init(from decoder: BinaryDecoder) throws {
        isDelivered = try decoder.decodeBool()
        isRead = try decoder.decodeBool()
    }
    
    public func encode(to encoder: BinaryEncoder) throws {
        encoder.encodeBool(isDelivered)
        encoder.encodeBool(isRead)
    }
}
