//
//  ContentView.swift
//  ObiletClone
//
//  Created by abdullah on 06.09.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("search_tab")
                .environment(\.locale, Locale(identifier: "tr"))
            
            Text("search_tab")
                .environment(\.locale, Locale(identifier: "en"))

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
