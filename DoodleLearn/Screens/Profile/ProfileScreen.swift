//
//  ProfileScreen.swift
//  DoodleLearn
//
//  Created by Thomas Mayr on 11.06.25.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        ScrollView(.vertical) {
            Circle()
                .fill(Color.teal)
                .frame(maxWidth: 200, maxHeight: 200)
                .padding()
            Text("Profile Name")
                .font(.largeTitle)
                .padding(.bottom, 4)
            Text("@UserName")
                .padding(.bottom, 4)
            Text("Joined 24.05.2025")
                .font(.caption)
                .padding(.bottom, 24)
            
            VStack {
                HStack {
                    Text("Badges")
                        .font(.headline)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Show all")
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 12)
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.flexible())], spacing: 16) {
                        ForEach(1...10, id: \.self) { _ in
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 75, height: 75)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 32)
            
            VStack {
                HStack {
                    Text("My Doodles")
                        .font(.headline)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Show all")
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 12)

                ScrollView(.horizontal) {
                    LazyHGrid(rows: [
                        GridItem(.flexible())
                    ], spacing: 16, ) {
                        ForEach(1...10, id: \.self) { _ in
                            Rectangle()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .scrollDisabled(true)
    }
}

#Preview {
    ProfileScreen()
}
