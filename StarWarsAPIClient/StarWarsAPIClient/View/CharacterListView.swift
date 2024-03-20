import SwiftUI

internal struct CharacterListView: View {
    let repository: CharacterRepository

    var body: some View {
        List {
            ForEach(self.repository.query()) { character in
                NavigationLink {
                    CharacterDetailView(character: character)
                } label: {
                    Text(character.name)
                }
            }
        }
    }
}

#Preview {
    CharacterListView(repository: SampleCharacterRepository())
}
