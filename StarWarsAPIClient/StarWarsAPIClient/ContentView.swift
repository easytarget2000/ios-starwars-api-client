import SwiftUI
import SwiftData

struct ContentView: View {
    private var characters = [Character]()

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(self.characters) { character in
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
    ContentView()
}
