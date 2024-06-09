//
//  RegistrationFlow_1.swift
//  Routing
//
//  Created by Aseem Aggarwal on 09/06/24.
//

import SwiftUI

struct RegistrationFlow_1: View {
    @EnvironmentObject var router: Router

    var body: some View {
        VStack {
            Text("RegistrationFlow_1")

            Button {
                router.navigate(to: .registrationView_2)
            } label: {
                Text("Next")
            }

        }
    }

}

#Preview {
    RegistrationFlow_1()
}
