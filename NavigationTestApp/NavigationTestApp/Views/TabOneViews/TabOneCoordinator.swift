import SwiftUI

enum TabOnePages {
    case tabOneParent, tabOneChild
}

final class TabOneCoordinator: Hashable {
    @Binding var navigationPath: NavigationPath
    
    private var id: UUID
    private var output: Output?
    private var page: TabOnePages
    
    struct Output {
        var goToMainScreen: () -> Void
    }
    
    init(navigationPath: Binding<NavigationPath>, page: TabOnePages, output: Output? = nil) {
        self.id = UUID()
        self.page = page
        self.output = output
        
        self._navigationPath = navigationPath
    }
    
    @ViewBuilder
    func view() -> some View {
        switch self.page {
        case .tabOneParent:
            tabOneParent()
            
        case .tabOneChild:
            tabOneChild()
        }
    }
    
    private func tabOneParent() -> some View {
        TabOneParent(
            output: .init(
                gotToChild: {
                    self.push(
                        TabOneCoordinator(
                            navigationPath: self.$navigationPath,
                            page: .tabOneChild
                        )
                    )
                }
            )
        )
    }
    
    private func tabOneChild() -> some View {
        TabOneChild(
            output: .init(
                gotToParent: {
                    self.output?.goToMainScreen()
                }
            )
        )
    }
}

extension TabOneCoordinator {
    static func == (
        lhs: TabOneCoordinator,
        rhs: TabOneCoordinator
    ) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func push<V>(_ value: V) where V : Hashable {
        navigationPath.append(value)
    }
}
