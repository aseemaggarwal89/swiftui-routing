//
//  LoginRootViewModel.swift
//  Routing
//
//  Created by Aseem Aggarwal on 09/06/24.
//

import Foundation
import SwiftUI

class LoginRootViewModel: ObservableObject {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func tappedOnRegistration() {
        router.changeRoot(rootType: .registrationView)
    }
    
    func tappedOnLogin() {
        router.changeRoot(rootType: .home)
    }
}
