//
//  LoginRootView.swift
//  Routing
//
//  Created by Aseem Aggarwal on 09/06/24.
//

import SwiftUI

struct LoginRoot: View {
    let viewModel: LoginRootViewModel
    
    init(viewModel: LoginRootViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text("Login Root View")
            Button {
                viewModel.tappedOnRegistration()
            } label: {
                Text("Signup")
            }
            
            Button {
                viewModel.tappedOnLogin()
            } label: {
                Text("Login")
            }

        }
        
    }
}

#Preview {
    LoginRoot(viewModel: LoginRootViewModel(router: DIContainer.shared.appRouter.resolve()))
}
