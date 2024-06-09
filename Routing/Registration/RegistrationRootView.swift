//
//  RegistrationRoot.swift
//  Routing
//
//  Created by Aseem Aggarwal on 09/06/24.
//

import SwiftUI

struct RegistrationRoot: View {
    let viewModel: RegistrationRootViewModel
    
    init(viewModel: RegistrationRootViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text("Registration Root View")

            Button {
                viewModel.tappedOnNext()
            } label: {
                Text("Next")
            }

        }.environmentObject(viewModel.router)
    }
}

#Preview {
    RegistrationRoot(viewModel: DIContainer.shared.registrationViewModel.resolve())
}
