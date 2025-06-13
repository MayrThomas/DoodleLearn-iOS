//
//  ContentView.swift
//  DoodleLearn
//
//  Created by Thomas Mayr on 11.06.25.
//

import SwiftUI

struct ContentView: View {
    enum Tab {
        case home, profile
    }
    
    @State private var selectedTab: Tab = .home
    @State private var homePath = NavigationPath()
    
    var body: some View {
        TabView(selection: createTabViewBinding()) {
            
            NavigationStack(path: $homePath) {
                HomeScreen(viewModel: HomeScreenViewModel(repository: LocalDoodleRepository()))
                    .navigationTitle("Browse")
                    .padding(8)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(Tab.home)
            .labelStyle(.iconOnly)
            
            ProfileScreen()
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }
            .tag(Tab.profile)
            .labelStyle(.iconOnly)
        }
    }
    
    private func createTabViewBinding() -> Binding<Tab> {
        Binding<Tab>(
            get: { selectedTab },
            set: { tab in
                if tab == selectedTab {
                    if tab == .home {
                        withAnimation {
                            homePath = NavigationPath()
                        }
                    }
                }
                
                selectedTab = tab
            }
        )
    }
}

#Preview {
    ContentView()
}
