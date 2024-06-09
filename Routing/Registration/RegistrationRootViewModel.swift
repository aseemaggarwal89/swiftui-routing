//
//  RegistrationRootViewModel.swift
//  Routing
//
//  Created by Aseem Aggarwal on 09/06/24.
//

import Foundation

class RegistrationRootViewModel: ObservableObject {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func tappedOnNext() {
        router.navigate(to: .registrationView_1)
    }
}
