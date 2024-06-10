//
//  DIContainer.swift
//  Routing
//
//  Created by Aseem Aggarwal on 09/06/24.
//

import Foundation
import Factory
import SwiftUI

final class DIContainer: ObservableObject, SharedContainer {
    static let shared = DIContainer()
    var manager = ContainerManager()
        
    var appRouter: Factory<Router> {
        self {
            Router(navPath: NavigationPath())
        }
        .singleton
    }
    
    var loginViewModel: Factory<LoginRootViewModel> {
        self { [unowned self] in
            LoginRootViewModel(router: appRouter())
        }
    }
    
    var registrationViewModel: Factory<RegistrationRootViewModel> {
        self { [unowned self] in
            RegistrationRootViewModel(router: appRouter())
        }
    }
    
    var homeViewModel: Factory<HomeRootViewModel> {
        self { [unowned self] in
            HomeRootViewModel(router: appRouter())
        }
    }
}

extension DIContainer {
    @ViewBuilder func getViewFrom(node: ChildViewType) -> some View {
        switch node {
        case .home_1:
            HomeChildNode_1()
        case .registrationView_1:
            RegistrationFlow_1()
        case .registrationView_2:
            RegistrationFlow_2()
        }
    }
        
    @ViewBuilder func getRootViewFrom(root: RootViewType) -> some View {
        switch root {
        case .login:
            LoginRoot(viewModel: loginViewModel())
        case .registrationView:
            RegistrationRoot(viewModel: registrationViewModel())
        case .home:
            HomeRootView(viewModel: homeViewModel())
        case .homeModal:
            HomeModalRoot()
        }
    }

    @ViewBuilder func getModalViewFrom(node: ModalChildViewType) -> some View {
        switch node {
        case .search:
            HomeChildNode_1()
        case .detail:
            HomeModalDetail()
        }
    }
}

