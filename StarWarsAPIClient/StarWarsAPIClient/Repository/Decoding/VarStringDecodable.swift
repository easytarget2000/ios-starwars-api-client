enum VarStringDecodable: Decodable {
    case single(String)
    case multiple([String])
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let homeworldString = try? container.decode(String.self) {
            self = .single(homeworldString)
        } else if let homeworldArray = try? container.decode([String].self) {
            self = .multiple(homeworldArray)
        } else {
            throw DecodingError.typeMismatch(
                VarStringDecodable.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Expected a string or an array of strings"
                )
            )
        }
    }
    
    func values() -> [String] {
        switch self {
        case .single(let name):
            return [name]
        case .multiple(let names):
            return names
        }
    }
}
