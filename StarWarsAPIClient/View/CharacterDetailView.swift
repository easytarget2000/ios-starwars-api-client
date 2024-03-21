import SwiftUI

internal struct CharacterDetailView: View {
    let viewModel: CharacterDetailViewModel
    
    init(character: Character) {
        self.viewModel = CharacterDetailViewModel(character: character)
    }
    
    var body: some View {
        VStack {
            Text(self.viewModel.formattedName)
            
            if let imageURL = self.viewModel.imageURL {
                AsyncImage(url: imageURL) {
                    $0.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            }
            
            if let height = self.viewModel.labeledHeight {
                Text(height)
            }
            
            if let mass = self.viewModel.labeledMass {
                Text(mass)
            }
        }
        .padding()
    }
}

#Preview {
    CharacterDetailView(
        character: SampleCharacterRepository.nextCharacter(id: 100)
    )
}
