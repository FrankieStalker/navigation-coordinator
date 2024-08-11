import SwiftUI

@main
struct NavigationTestApp: App {
    @StateObject private var navigationCoordinator = NavigationCoordinator(path: NavigationPath())
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationCoordinator.path) {
                navigationCoordinator.view()
                    .environmentObject(navigationCoordinator)
                    .navigationDestination(for: TabOneCoordinator.self) { coordinator in
                        coordinator.view()
                    }
            }
        }
    }
}
