//
//  ContentView.swift
//  PorteAI
//
//  Created by Laxman Penmetsa on 10/8/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack { // 1. Set up the navigation container
                    VStack(spacing: 20) {
                        Text("This is the Content View")
                            .font(.title)
                        
                        // 2. Add a link to trigger the transition
                        NavigationLink("Go to Second Screen", destination: ChatView())
                            .buttonStyle(.borderedProminent)
                    }
                    .navigationTitle("Home") // Adds a title to the top bar
                }
    }
    
}

#Preview {
    ContentView()
}
