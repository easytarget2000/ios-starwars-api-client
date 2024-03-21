internal protocol CharacterRepository {
    func query() async throws -> [Character]
}
