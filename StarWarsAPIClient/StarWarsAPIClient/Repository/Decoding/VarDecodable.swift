internal enum VarDecodable<T, U>: Decodable where T: Decodable, U: Decodable {
    case tValue(T)
    case uValue(U)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let stringValue = try? container.decode(T.self) {
            self = .tValue(stringValue)
        } else if let numericValue = try? container.decode(U.self) {
            self = .uValue(numericValue)
        } else {
            let debugDescription = "Expected \(T.Type.self) or \(U.Type.self)."
            let errorContext = DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: debugDescription
            )
            throw DecodingError.typeMismatch(VarDecodable.self, errorContext)
        }
    }
}

extension VarDecodable where U == Array<T> {
    func values() -> [T] {
        switch self {
        case .tValue(let singleValue):
            return [singleValue]
        case .uValue(let array):
            return array
        }
    }
}
