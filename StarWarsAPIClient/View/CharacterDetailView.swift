import SwiftUI

internal struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        VStack {
            Text(self.character.name)
            
            if let imageURL = self.character.imageURL {
                AsyncImage(url: URL(string: imageURL)) { $0.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            }
            
            if let heightM = self.character.heightM {
                Text(
                    localizedString(for: "character_height_m_format", heightM)
                )
            }
            
            if let massKG = self.character.massKG {
                Text(
                    localizedString(for: "character_mass_kg_format", massKG)
                )
            }
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
