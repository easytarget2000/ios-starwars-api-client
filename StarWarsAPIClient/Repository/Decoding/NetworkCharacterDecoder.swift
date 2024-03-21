import Foundation

internal struct NetworkCharacterDecoder {
    private let jsonDecoder = JSONDecoder()
    
    func decode(_ data: Data) throws -> [NetworkCharacter] {
        try self.jsonDecoder.decode([NetworkCharacter].self, from: data)
    }
}
