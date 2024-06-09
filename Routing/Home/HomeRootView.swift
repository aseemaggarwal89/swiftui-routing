//
//  Home_Root.swift
//  Routing
//
//  Created by Aseem Aggarwal on 09/06/24.
//

import SwiftUI

struct HomeRootView: View {
    let viewModel: HomeRootViewModel
    
    init(viewModel: HomeRootViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text("Home Root View")
            Button {
                viewModel.tappedOnNext()
            } label: {
                Text("Next")
            }
        }.environmentObject(viewModel.router)
    }
}

#Preview {
    HomeRootView(viewModel: DIContainer.shared.homeViewModel.resolve())
}
