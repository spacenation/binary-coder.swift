import Foundation

public protocol UnsignedIntegerScalable {
    static func scaling(integer: UInt8) -> Self
    static func scaling(integer: UInt16) -> Self
    static func scaling(integer: UInt32) -> Self
    static func scaling(integer: UInt64) -> Self
}

public extension UnsignedIntegerScalable {
    init(scaling integer: UInt8) {
        self = Self.scaling(integer: integer)
    }
    
    init(scaling integer: UInt16) {
        self = Self.scaling(integer: integer)
    }
    
    init(scaling integer: UInt32) {
        self = Self.scaling(integer: integer)
    }
    
    init(scaling integer: UInt64) {
        self = Self.scaling(integer: integer)
    }
}

public prefix func %<T: UnsignedIntegerScalable>(integer: UInt8) -> T {
    T(scaling: integer)
}

public prefix func %<T: UnsignedIntegerScalable>(integer: UInt16) -> T {
    T(scaling: integer)
}

public prefix func %<T: UnsignedIntegerScalable>(integer: UInt32) -> T {
    T(scaling: integer)
}

public prefix func %<T: UnsignedIntegerScalable>(integer: UInt64) -> T {
    T(scaling: integer)
}

public prefix func %<T: UnsignedIntegerScalable>(integer: UInt8?) -> T? {
    if let integer = integer {
        return T(scaling: integer)
    } else {
        return nil
    }
}

public prefix func %<T: UnsignedIntegerScalable>(integer: UInt16?) -> T? {
    if let integer = integer {
        return T(scaling: integer)
    } else {
        return nil
    }
}

public prefix func %<T: UnsignedIntegerScalable>(integer: UInt32?) -> T? {
    if let integer = integer {
        return T(scaling: integer)
    } else {
        return nil
    }
}

public prefix func %<T: UnsignedIntegerScalable>(integer: UInt64?) -> T? {
    if let integer = integer {
        return T(scaling: integer)
    } else {
        return nil
    }
}
