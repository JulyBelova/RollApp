//
//  SignInViewController.swift
//  RollApp
//
//  Created by July Belova on 08.11.2024.
//
import UIKit

//MARK: - SignInViewController
final class SignInViewController: UIViewController {
    
    //MARK: - Private Property
    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor.accentBlue.cgColor,
            UIColor.accentDarkBlue.cgColor
        ]
        layer.locations = [0.0, 1.0]
        return layer
    }()
    
    private let logoImageView = LogoView()
    private let loginTF = RegisterTextField(placeholder: ConstantsSignInVC.loginTF)
    private let passwordTF = RegisterTextField(placeholder: ConstantsSignInVC.passwordTF)
    
    private let forgotPassLabel: UILabel = {
        let element = UILabel()
        element.text = ConstantsSignInVC.forgotPassLabel
        element.textColor = .systemGray2
        element.font = .boldSystemFont(ofSize: 12)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let myButton = MyButton(buttonText: ConstantsSignInVC.myButton)
    
    private let imageView: UIView = {
        let element = UIView()
        element.backgroundColor = .accentLightBlue
        element.layer.cornerRadius = 25
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    private let chevron: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(systemName: SystemImageName.chevronUp)
        element.tintColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    private let signUpLabel: UILabel = {
        let element = UILabel()
        element.text = ConstantsSignInVC.signUpLabel
        element.textColor = .white
        element.font = .boldSystemFont(ofSize: 20)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
}

//MARK: - Setting Views
private extension SignInViewController {
    func setupView() {
        
        loginTF.backgroundColor = .accentBlue
        loginTF.textColor = .yellow
        
        passwordTF.backgroundColor = .accentBlue
        passwordTF.textColor = .yellow
        
        addSubViews()
        addAction()
        setupLayout()
    }
}
//MARK: - Setting
private extension SignInViewController {
    func addSubViews() {
        view.layer.addSublayer(gradientLayer)
        view.addSubview(logoImageView)
        view.addSubview(loginTF)
        view.addSubview(passwordTF)
        
        view.addSubview(forgotPassLabel)
        view.addSubview(myButton)
        
        view.addSubview(imageView)
        view.addSubview(chevron)
        view.addSubview(signUpLabel)
    }
    
    func addAction () {
        let forgotPassLabelTap = UITapGestureRecognizer(target: self, action: #selector(forgotPassTap(_:)))
        self.forgotPassLabel.isUserInteractionEnabled = true
        self.forgotPassLabel.addGestureRecognizer(forgotPassLabelTap)
        
        myButton.addTarget(self, action: #selector(selectMyButtonTapped), for: .touchUpInside)
        
        let signUpTap = UITapGestureRecognizer(target: self, action: #selector(signUpTap(_:)))
        self.signUpLabel.isUserInteractionEnabled = true
        self.signUpLabel.addGestureRecognizer(signUpTap)
    }
    
    @objc func forgotPassTap(_ sender: UITapGestureRecognizer) {
        let viewControllerToPresent = ForgotPassAlertVC()
        viewControllerToPresent.modalPresentationStyle = .overFullScreen
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
    @objc private func selectMyButtonTapped() {
        let viewControllerToPresent = HomeViewController()
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
    @objc func signUpTap(_ sender: UITapGestureRecognizer) {
        showMyViewControllerInACustomizedSheet()
    }
    
    func showMyViewControllerInACustomizedSheet() {
        let viewControllerToPresent = SingUpViewController()
        if let sheet = viewControllerToPresent.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.largestUndimmedDetentIdentifier = .none
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            sheet.prefersGrabberVisible = true
        }
        present(viewControllerToPresent, animated: true, completion: nil)
    }
}

//MARK: - Layout
private extension SignInViewController {
    func setupLayout() {
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -85).isActive = true
        logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -15).isActive = true
        
        loginTF.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50).isActive = true
        loginTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        passwordTF.topAnchor.constraint(equalTo: loginTF.bottomAnchor, constant: 50).isActive = true
        passwordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        forgotPassLabel.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 50).isActive = true
        forgotPassLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        myButton.topAnchor.constraint(equalTo: forgotPassLabel.bottomAnchor, constant: 20).isActive = true
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 40).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        chevron.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        chevron.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 0).isActive = true
        
        signUpLabel.centerXAnchor.constraint(equalTo: chevron.centerXAnchor).isActive = true
        signUpLabel.topAnchor.constraint(equalTo: chevron.bottomAnchor, constant: 0).isActive = true
    }
}

//#Preview("SignInViewController"){
//    SignInViewController()
//}
