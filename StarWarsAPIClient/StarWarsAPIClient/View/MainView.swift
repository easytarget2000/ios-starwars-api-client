import SwiftUI

struct MainView: View {
    let repository: CharacterRepository

    var body: some View {
        NavigationSplitView {
            CharacterListView(repository: self.repository)
        } detail: {
            Text("Select an item")
        }
    }
}

#Preview {
    MainView(repository: SampleCharacterRepository())
}
