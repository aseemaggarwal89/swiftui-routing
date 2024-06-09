//
//  Router.swift
//  Routing
//
//  Created by Aseem Aggarwal on 08/06/24.
//

import Foundation
import SwiftUI
 
enum Destination: Hashable {
    case home_1
    case registrationView_1
    case registrationView_2
}


enum RootViewType: Codable, Hashable {
    case login
    case registrationView
    case home
}

class Router: ObservableObject {
    let id = UUID()
    @Published var rootType: RootViewType = .login
    @Published var navPath: NavigationPath
    
    init(navPath: NavigationPath) {
        self.navPath = navPath
    }
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func changeRoot(rootType: RootViewType) {
        navigateToRoot()
        self.rootType = rootType
    }
    
    func skipView(count: Int) {
        if count <= navPath.count {
            navPath.removeLast(count)
        }
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}

struct AppContainerView: View {
    var router: Router
    var body: some View {
        AppNavigationNode(router: router)
            .environmentObject(router)
    }
}

struct AppNavigationNode: View, Equatable {
    @StateObject var router: Router
    static func == (lhs: AppNavigationNode, rhs: AppNavigationNode) -> Bool {
        return lhs.router.rootType == rhs.router.rootType
    }

    @ViewBuilder
    var body: some View {
        NavigationStack(path:$router.navPath) {
            RootView(rootType: router.rootType)
            .navigationDestination(for: Destination.self) { route in
                DIContainer.shared.getViewFrom(node: route)
            }
        }
    }
}

struct RootView: View, Equatable {
    static func == (lhs: RootView, rhs: RootView) -> Bool {
        return lhs.rootType == rhs.rootType
    }

    var rootType: RootViewType
    
    var body: some View {
        DIContainer.shared.getRootViewFrom(root: rootType)
//        switch rootType {
//        case .login:
//            LoginRoot(viewModel: DIContainer.shared.loginViewModel.resolve())
//        case .registrationView:
//            RegistrationRoot()
//        case .home:
//            HomeRootView()
//        }
    }
}
