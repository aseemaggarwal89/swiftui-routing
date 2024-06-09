//
//  ContentView.swift
//  Routing
//
//  Created by Aseem Aggarwal on 05/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        DIContainer.shared.appContainerView.resolve()
    }
}

#Preview {
    ContentView()
}
