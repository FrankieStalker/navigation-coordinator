//
//  ContentView.swift
//  NavigationTestApp
//
//  Created by Frankie Stalker on 08/08/2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var navigationCoordinator: NavigationCoordinator
    
    var body: some View {
        tabs
    }
    
    private var tabs: some View {
        TabView {
            tabOne
        }
    }
    
    private var tabOne: some View {
            TabOneCoordinator(
                navigationPath: $navigationCoordinator.path,
                page: .tabOneParent,
                output: .init(
                    goToMainScreen: {
                        navigationCoordinator.popToRoot()
                    }
                )
            )
            .view()
            .tabItem {
                tabLabels("tab 1", systemImage: "circle.lefthalf.filled")
            }
    }
    
    private func tabLabels(_ name: String, systemImage: String) -> some View {
        Label(name, systemImage: systemImage)
            .foregroundStyle(Color.black)
    }
}
