//
//  RegistrationFlow_2.swift
//  Routing
//
//  Created by Aseem Aggarwal on 09/06/24.
//

import SwiftUI

struct RegistrationFlow_2: View {
    @EnvironmentObject var router: Router

    var body: some View {
        VStack {
            Text("RegistrationFlow_2")
            Button {
                router.changeRoot(rootType: .home)
            } label: {
                Text("Login")
            }
            
            Button {
                router.navigateToRoot()
            } label: {
                Text("Back to Registration Root View")
            }
        }

    }
}

#Preview {
    RegistrationFlow_2()
}
