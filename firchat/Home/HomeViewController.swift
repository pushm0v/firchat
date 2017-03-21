//
//  HomeViewController.swift
//  happyshop
//
//  Created by Bherly Novrandy on 2/8/17.
//  Copyright © 2017 Bherly Novrandy. All rights reserved.
//

import UIKit
import Segmentio

protocol IHomeView: class {
    
}

class HomeViewController: BaseViewController {

    @IBOutlet weak var segmentioView: Segmentio!
    @IBOutlet weak var childView: UIView?
    
    var presenter: IHomePresenter!
    
    init() {
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDefaultNavigationBar(activeMenu: .Home)
        self.showFABButton(show: true)
        self.setupSegmentedMenu()
    }
    
    func setupSegmentedMenu() {
        SegmentioBuilder.buildSegmentioView(segmentioView: segmentioView, segmentioStyle: .onlyLabel, contents: [
            (title: "1", image: nil),
            (title: "2", image: nil)
            ])
        
        segmentioView.valueDidChange = { [weak self] _, segmentIndex in
            print(segmentIndex)
        }
    }
}

extension HomeViewController: IHomeView {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMenuCell", for: indexPath) as! HomeMenuCell

        cell.menu = presenter.menus[indexPath.row]
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menu = presenter.menus[indexPath.row]
        AppRouter.sharedInstance.presentRoutePath(routePath: menu.route, parameters: ["routePath": menu.route as String as AnyObject])
    }
}
