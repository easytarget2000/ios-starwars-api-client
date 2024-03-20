import SwiftUI

internal struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        VStack {
            Text(self.character.name)
            
            AsyncImage(url: URL(string: self.character.imageURL)) { $0.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            
            Text(
                localizedString(
                    for: "character_height_m_format",
                    self.character.heightM
                )
            )
            
            Text(
                localizedString(
                    for: "character_mass_kg_format",
                    self.character.massKG
                )
            )
        }
        .padding()
    }
}

fileprivate func localizedString(for key: String, _ arguments: CVarArg...)
-> String {
    String(format: NSLocalizedString(key, comment: ""), arguments: arguments)
}

#Preview {
    CharacterDetailView(
        character: SampleCharacterRepository.nextCharacter(id: 100)
    )
}
