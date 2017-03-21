//
//  BaseAppRouter.swift
//  happyshop
//
//  Created by Bherly Novrandy on 2/8/17.
//  Copyright © 2017 Bherly Novrandy. All rights reserved.
//

import Foundation
import Swinject

public protocol IProductRouter : class {
    func presentModule(module: Module, parameters:[String:AnyObject])
}

public class BaseAppRouter : IAppRouter {
//    private let rootVC:UIViewController!
    private let assembler:Assembler!
    private let products : [String:(_ appRouter:IAppRouter)->IProductRouter]
    private let navigationController:UINavigationController?
    
    init(navigationController:UINavigationController?, assembler:Assembler, products:[String:(_ appRouter:IAppRouter)->IProductRouter]){
//        self.rootVC = rootVC
        self.navigationController = navigationController
        self.assembler = assembler
        self.products = products
    }
    
    public var resolver: Resolver {
        return assembler.resolver
    }
    
    public func presentModule(module: Module, parameters: [String:AnyObject]) {
        if let productConstuctor = products[module.productName] {
            let product = productConstuctor(self)
            product.presentModule(module: module, parameters: parameters)
        }
    }
    
    public func displayView(view:UIViewController?, animateDismiss:Bool, animateDisplay:Bool){
        displayView(view: view, animateDismiss:animateDismiss, animateDisplay:animateDisplay, completion:nil)
    }
    
    public func displayView(view:UIViewController?, animateDismiss:Bool, animateDisplay:Bool, completion:(() -> Void)?){
        navigationController?.popViewController(animated: animateDismiss)
        if let view = view {
            navigationController?.pushViewController(view, animated: animateDisplay)
            if let completion = completion {
                completion()
            }
        }
    }
    
    public func displayViewWithoutDismiss(view:UIViewController?,animateDisplay:Bool) {
        view?.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(view!, animated: true)
    }
    
    public func dismissViewFromNavigationController(animated: Bool, completion: ()->()) {
        navigationController?.popViewController(animated: animated)
    }
    
    public func presentViewModally(view: UIViewController) {
        navigationController?.present(view, animated: true, completion: nil)
    }
    
    public func presentView(view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }
    
    public func dismissView() {
        navigationController?.popViewController(animated: true)
    }
    
    public func presentRoutePath(routePath: String, parameters: [String:AnyObject]) {
        self.presentModule(module: Products.Chat.getModule(routePath: routePath) , parameters: parameters)
    }
}
