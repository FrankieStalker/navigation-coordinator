//
//  NavigationCoordinator.swift
//  NavigationTestApp
//
//  Created by Frankie Stalker on 08/08/2024.
//

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
