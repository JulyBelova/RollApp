//
//  MainPageVC.swift
//  RollApp
//
//  Created by July Belova on 08.11.2024.
//
import UIKit

class MainPageViewController: UIViewController {

    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addChildsVC()
    }
    private func addChildsVC() {
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
    }

}


