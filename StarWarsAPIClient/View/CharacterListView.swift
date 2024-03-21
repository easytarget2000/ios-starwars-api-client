import SwiftUI

internal struct CharacterListView: View {
    @StateObject private var viewModel: CharacterListViewModel
    
    init(repository: CharacterRepository) {
        let viewModel = CharacterListViewModel(repository: repository)
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List {
            ForEach(self.viewModel.characters) { character in
                NavigationLink {
                    CharacterDetailView(character: character)
                } label: {
                    Text(character.name)
                }
            }
        }
        .task {
            await self.viewModel.queryCharacters()
        }
    }
}

#Preview {
    CharacterListView(repository: SampleCharacterRepository())
}
