//
//  Router.swift
//  Routing
//
//  Created by Aseem Aggarwal on 08/06/24.
//

import Foundation
import SwiftUI
 
enum ChildViewType: Hashable {
    case home_1
    case registrationView_1
    case registrationView_2
}

enum RootViewType: Codable, Hashable {
    case login
    case registrationView
    case home
    case homeModal
}

class Router: ObservableObject {
    let id = UUID()
    @Published var rootType: RootViewType = .login
    @Published var navPath: NavigationPath
    
    init(navPath: NavigationPath) {
        self.navPath = navPath
    }
    
    func navigate(to destination: ChildViewType) {
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

struct AppNavigationNode: View, Equatable {
    @ObservedObject var router: Router
    static func == (lhs: AppNavigationNode, rhs: AppNavigationNode) -> Bool {
        return lhs.router.rootType == rhs.router.rootType
    }

    @ViewBuilder
    var body: some View {
        NavigationStack(path:$router.navPath) {
            RootView(rootType: router.rootType)
            .navigationDestination(for: ChildViewType.self) { route in
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
    }
}



enum ModalChildViewType: Hashable {
    case search
    case detail
}

class ModalViewRouter: ObservableObject {
    let id = UUID()
    @Published var navPath: NavigationPath
    @Published var rootType: RootViewType
    
    init(navPath: NavigationPath = NavigationPath(), rootType: RootViewType) {
        self.navPath = navPath
        self.rootType = rootType
    }
    
    func navigate(to destination: ModalChildViewType) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
}

struct RootModalNode: View, Equatable {
    @ObservedObject var router: ModalViewRouter
    static func == (lhs: RootModalNode, rhs: RootModalNode) -> Bool {
        return lhs.router.rootType == rhs.router.rootType
    }

    @ViewBuilder
    var body: some View {
        NavigationStack(path:$router.navPath) {
            DIContainer.shared.getRootViewFrom(root: router.rootType)
            .navigationDestination(for: ModalChildViewType.self) { route in
                DIContainer.shared.getModalViewFrom(node: route)
            }
        }
        .environmentObject(router)
    }
}
