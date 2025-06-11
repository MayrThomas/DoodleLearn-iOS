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
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            NavigationView() {
                HomeScreen()
                    .navigationTitle("Browse")
                    .padding(8)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(Tab.home)
            .labelStyle(.iconOnly)
            
            NavigationView() {
                ProfileScreen()
                    .navigationTitle("Profile")
            }
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }
            .tag(Tab.profile)
            .labelStyle(.iconOnly)
        }
    }
}

#Preview {
    ContentView()
}
