//
//  HomeChildNode_1.swift
//  Routing
//
//  Created by Aseem Aggarwal on 09/06/24.
//

import SwiftUI

struct HomeChildNode_1: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        Text("HomeChildNode_1")
        
        
        Button {
            router.changeRoot(rootType: .login)
        } label: {
            Text("Logout")
        }
    }
}

#Preview {
    HomeChildNode_1()
}
