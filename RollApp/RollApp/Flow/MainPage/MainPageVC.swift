//
//  MainPageVC.swift
//  RollApp
//
//  Created by July Belova on 08.11.2024.
//
import UIKit

class MainPageViewController: UIViewController {

    enum MenuState {
        case menuClose
        case menuOpen
    }
    
    private var menuState: MenuState = .menuClose
    
    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    var navVC:UINavigationController?
    lazy var profileVC = ProfileViewController()
    lazy var wishlistVC = WishlistViewController()
    lazy var loyaltyPointsVC = LoyaltyPointsViewController()
    lazy var paymentMethodsVC = PaymentMethodsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildsVC()
    }
    
    private func addChildsVC() {
        
        menuVC.delegate = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        
        homeVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
    }
}

extension MainPageViewController: HomeViewControllerDelegate {
    func didSelectMenuItem() {
        toggleMenu(completion: nil)
        
    }
    func toggleMenu(completion: (() -> Void)?) {
        switch menuState {
        case .menuClose:

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 8, options: .curveEaseInOut) {
                
                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.width - 100
                self.homeVC.navigationItem.leftBarButtonItem?.image = UIImage(named: "close")
                
            } completion: { [weak self] (done) in
                if done {
                    self?.menuState = .menuOpen
                }
            }
            
        case .menuOpen:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 8, options: .curveEaseInOut) {
                
                self.navVC?.view.frame.origin.x = 0
                self.homeVC.navigationItem.leftBarButtonItem?.image = UIImage(named: "menu")
                
            } completion: { [weak self] (done) in
                if done {
                    self?.menuState = .menuClose
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        }
    }
}

extension MainPageViewController: MenuViewControllerDelegate {
    
    func didSelect(menuItem: MenuViewController.MenuOption) {
       
        toggleMenu(completion: nil)
        
        switch menuItem {
        case .profile: self.addProfileVC()
        case .wishlist: self.addWishlistVC()
        case .loyaltyPoints: self.addLoyaltyPointsVC()
        case .paymentMethods: self.addPaymentMethodsVC()
        }
    }
    
    func addProfileVC() {
        let vc = profileVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func addWishlistVC() {
        let vc = wishlistVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func addLoyaltyPointsVC() {
        let vc = loyaltyPointsVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func addPaymentMethodsVC() {
        let vc = paymentMethodsVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
//    func resetToHome() {
//        homeVC.title = "Home"
//        homeVC.view.removeFromSuperview()
//        homeVC.didMove(toParent: nil)
//    }
}
                                        
