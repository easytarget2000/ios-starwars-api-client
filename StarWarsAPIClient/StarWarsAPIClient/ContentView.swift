import SwiftUI
import SwiftData

struct ContentView: View {
    let repository: CharacterRepository

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(self.repository.query()) { character in
                    NavigationLink {
                        Text(character.name)
                    } label: {
                        Text(character.name)
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
}

#Preview {
    ContentView(repository: SampleCharacterRepository())
}
