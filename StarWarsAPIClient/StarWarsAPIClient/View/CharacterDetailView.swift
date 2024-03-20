import SwiftUI

internal struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        Text(self.character.name)
    }
}

#Preview {
    CharacterDetailView(
        character: SampleCharacterRepository.nextCharacter(id: 100)
    )
}
