//
//  RoutingApp.swift
//  Routing
//
//  Created by Aseem Aggarwal on 05/06/24.
//

import SwiftUI

@main
struct RoutingApp: App {
    @StateObject var router: Router = DIContainer.shared.appRouter.resolve()

    var body: some Scene {
        WindowGroup {
            AppNavigationNode(router: router)
                .environmentObject(router)
        }
    }
}
