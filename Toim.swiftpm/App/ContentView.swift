import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            IntroView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
