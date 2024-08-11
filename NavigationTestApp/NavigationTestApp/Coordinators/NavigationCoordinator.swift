import SwiftUI

final class NavigationCoordinator: ObservableObject {
    @Published var path: NavigationPath
    
    init(path: NavigationPath) {
        self.path = path
    }
    
    @ViewBuilder
    func view() -> some View {
        MainView()
    }
    
    func popToRoot() {
        self.path = .init()
    }
}
