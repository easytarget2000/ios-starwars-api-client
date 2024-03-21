import SwiftUI

struct MainView: View {
    let repository: CharacterRepository
    
    init(repository: CharacterRepository = NetworkCharacterRepository()) {
        self.repository = repository
    }

    var body: some View {
        NavigationSplitView {
            CharacterListView(repository: self.repository)
        } detail: {
            Text("main_nav_detail")
        }
    }
}

#Preview {
    MainView(repository: SampleCharacterRepository())
}
