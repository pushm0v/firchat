//
//  Assembly.swift
//  happyshop
//
//  Created by Bherly Novrandy on 2/8/17.
//  Copyright © 2017 Bherly Novrandy. All rights reserved.
//

import Foundation
import Swinject

class CommonAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(IAppRouter.self) {(r) in
            return AppRouter.sharedInstance
        }
    }
}
