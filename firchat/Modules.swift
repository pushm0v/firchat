//
//  Module.swift
//  happyshop
//
//  Created by Bherly Novrandy on 2/8/17.
//  Copyright © 2017 Bherly Novrandy. All rights reserved.
//

import Foundation

public protocol IModule {
    func presentView(parameters: [String:AnyObject])
}

public protocol Module : Product {
    var routePath : String { get }
}

public protocol Product {
    var productName : String { get }
}


public enum Products {
    case FIRChatProduct
    
    public var productName: String {
        switch self {
        case .FIRChatProduct:
            return "Chat"
        }
    }
    
    public enum Chat: Module {
        case HomeModule
        
        public var productName: String {
            return "Chat"
        }
        
        public var routePath: String {
            switch self {
            case .HomeModule:
                return "/chat/home"
            }
        }
        
        static func getModule(routePath: String) -> Chat {
//            if routePath.contains(Shop.ItemsModule.routePath) {
//                return Shop.ItemsModule
//            }
            
            return Chat.HomeModule
        }
    }
}
