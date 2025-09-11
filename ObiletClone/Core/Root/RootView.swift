//
//  RootView.swift
//  ObiletClone
//
//  Created by abdullah on 06.09.2025.
//

import SwiftUI

struct RootView: View {
    
    init() {
        UIScrollView.appearance().bounces = false

    }
    
    
    
    var body: some View {
        OTabView()
    }
}

#Preview {
    RootView()
}
