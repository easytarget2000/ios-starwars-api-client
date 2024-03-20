import SwiftUI
import SwiftData

@main
struct App: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView(repository: SampleCharacterRepository())
        }
    }
}
