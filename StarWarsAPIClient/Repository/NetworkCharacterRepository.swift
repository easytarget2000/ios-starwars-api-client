import Foundation

internal class NetworkCharacterRepository: CharacterRepository {
    private static let url =
    URL(string: "https://akabab.github.io/starwars-api/api/all.json")!
    private let decoder = NetworkCharacterDecoder()

    func query() async throws -> [Character] {
        let (data, _) = try await URLSession.shared.data(from: Self.url)
        let characters = try self.decoder.decode(data)
        return characters.map { $0.internalValue() }
    }
}
