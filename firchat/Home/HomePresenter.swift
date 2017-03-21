//
//  HomePresenter.swift
//  happyshop
//
//  Created by Bherly Novrandy on 2/8/17.
//  Copyright © 2017 Bherly Novrandy. All rights reserved.
//

import Foundation

protocol IHomePresenter : class {
    var menus: [HomeMenu] { get }
    func populateMenus()
}

class HomePresenter: IHomePresenter {
    
    let wireframe: IHomeWireframe
    weak var view: IHomeView?
    var menus: [HomeMenu] = [HomeMenu]()
    
    let staticMenus: [String:String] = [
        "Add Item": "/shop/items/add",
        "My Items": "/shop/items"
    ]
    
    init(view: IHomeView, wireframe: IHomeWireframe) {
        self.wireframe = wireframe
        self.view = view
    }
    
    func populateMenus() {
        menus.removeAll()
        for (menu,route) in staticMenus {
            let m = HomeMenu(name: menu, route: route)
            menus.append(m)
        }
    }
}
