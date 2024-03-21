import os
import SwiftUI

internal struct CharacterListView: View {
    let repository: CharacterRepository
    @State private var characters: [Character] = []
    private let queryLogger = Logger(subsystem: "Main", category: "Query")

    var body: some View {
        List {
            ForEach(self.characters) { character in
                NavigationLink {
                    CharacterDetailView(character: character)
                } label: {
                    Text(character.name)
                }
            }
        }
        .task {
            do {
                self.characters = try await repository.query()
            } catch let error {
                self.characters = []
                self.queryLogger.error("Unable to query characters: \(error)")
            }
        }
    }
}

#Preview {
    CharacterListView(repository: SampleCharacterRepository())
}
