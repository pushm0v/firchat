//
//  BaseViewController.swift
//  firchat
//
//  Created by Bherly Novrandy on 3/21/17.
//  Copyright © 2017 Bherly Novrandy. All rights reserved.
//

import Foundation
import UIKit
import KCFloatingActionButton

protocol IBaseViewController: class {
    func setupDefaultNavigationBar(activeMenu: MenuButton)
}

enum MenuButton: String {
    case Home = "home", Search = "search", Notification = "notification", Chat = "chat", Profile = "profile"
}

class BaseViewController: UIViewController, IBaseViewController {
    
    internal var activeMenu: MenuButton?
    var fabButton: KCFloatingActionButton?
    
    func setupFABButton() {
        fabButton = KCFloatingActionButton()
        fabButton?.addItem(title: "Hello, World!")
    }
    
    func showFABButton(show: Bool) {
        if show {
            setupFABButton()
        }
        if let fab = fabButton, show {
            self.view.addSubview(fab)
        }
    }
    
    func setupDefaultNavigationBar(activeMenu: MenuButton) {
        self.activeMenu = activeMenu
        if let navBar = self.navigationController {
            let bounds = navBar.navigationBar.frame
            
            let titleView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
            
            let buttonWidth = ((titleView.frame.width - 24) / 5)
            
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: buttonWidth, height: bounds.height))
            button.setTitle("Button 1", for: UIControlState.normal)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            titleView.addSubview(button)
            
            let button2 = UIButton(frame: CGRect(x: buttonWidth, y: 0, width: buttonWidth, height: bounds.height))
            button2.setTitle("Button 2", for: UIControlState.normal)
            titleView.addSubview(button2)
            
            let button3 = UIButton(frame: CGRect(x: buttonWidth * 2, y: 0, width: buttonWidth, height: bounds.height))
            button3.setTitle("Button 3", for: UIControlState.normal)
            titleView.addSubview(button3)
            
            let button4 = UIButton(frame: CGRect(x: buttonWidth * 3, y: 0, width: buttonWidth, height: bounds.height))
            button4.setTitle("Button 4", for: UIControlState.normal)
            titleView.addSubview(button4)
            
            let button5 = UIButton(frame: CGRect(x: buttonWidth * 4, y: 0, width: buttonWidth, height: bounds.height))
            button5.setTitle("Button 5", for: UIControlState.normal)
            titleView.addSubview(button5)
            
            navBar.navigationBar.barTintColor = UIColor.blue
            navBar.navigationBar.topItem?.titleView = titleView
        }
    }
    
    func buttonTapped() {
        
    }
}
