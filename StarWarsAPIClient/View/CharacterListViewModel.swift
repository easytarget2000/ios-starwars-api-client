import Foundation
import os

internal class CharacterListViewModel: ObservableObject {
    let repository: CharacterRepository
    @Published var characters: [Character] = []
    private let queryLogger = Logger(subsystem: "Main", category: "Query")

    init(repository: CharacterRepository) {
        self.repository = repository
    }

    func queryCharacters() async {
        let characters: [Character]
        do {
            characters = try await repository.query()
        } catch let error {
            characters = []
            self.queryLogger.error("Unable to query characters: \(error)")
        }
        
        DispatchQueue.main.async {
            self.characters = characters
        }
    }
}
