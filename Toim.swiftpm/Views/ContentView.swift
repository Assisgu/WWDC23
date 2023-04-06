import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("record")
                .imageScale(.small)
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
    }
}
