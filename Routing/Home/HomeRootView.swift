//
//  Home_Root.swift
//  Routing
//
//  Created by Aseem Aggarwal on 09/06/24.
//

import SwiftUI

struct HomeRootView: View {
    @ObservedObject var viewModel: HomeRootViewModel
    @StateObject var modalRouter: ModalViewRouter = ModalViewRouter(rootType: .homeModal)
    
    init(viewModel: HomeRootViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text("Home Root View")
            Button {
                viewModel.openModalWorkflow()
            } label: {
                Text("Modal Workflow")
            }
            
            Button {
                viewModel.tappedOnNext()
            } label: {
                Text("Next")
            }
        }
        .sheet(isPresented: $viewModel.openSheet) {
            RootModalNode(router: modalRouter)
        }
        .environmentObject(viewModel.router)
    }
}

#Preview {
    HomeRootView(viewModel: DIContainer.shared.homeViewModel.resolve())
}
