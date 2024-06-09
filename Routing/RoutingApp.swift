//
//  RoutingApp.swift
//  Routing
//
//  Created by Aseem Aggarwal on 05/06/24.
//

import SwiftUI

@main
struct RoutingApp: App {
    var body: some Scene {
        WindowGroup {
            DIContainer.shared.appContainerView.resolve()
        }
    }
}
