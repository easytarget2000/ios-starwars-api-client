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
            throw DecodingError.typeMismatch(
                VarStringDecodable.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unexpected data type."
                )
            )
        }
    }
}
