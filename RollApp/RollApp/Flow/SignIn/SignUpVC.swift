//
//  SignUpVC.swift
//  RollApp
//
//  Created by July Belova on 08.11.2024.
//
import UIKit

//MARK: - SingUpViewController
final class SingUpViewController: UIViewController {
    
    //MARK: - Private Property
    private let signUpLabel: UILabel = {
        let element = UILabel()
        element.text = ConstantsSignInVC.signUpLabel
        element.textColor = .white
        element.textAlignment = .center
        element.font = UIFont.systemFont(ofSize: 20)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let nameTF = RegisterTextField(placeholder: ConstantsSignUpVC.nameTF)
    private let loginTF = RegisterTextField(placeholder: ConstantsSignUpVC.loginTF)
    private let passwordTF = RegisterTextField(placeholder: ConstantsSignUpVC.passwordTF)
    private let conformPasswordTF = RegisterTextField(placeholder: ConstantsSignUpVC.conformPasswordTF)
    
    private let myButton = MyButton(buttonText: ConstantsSignUpVC.myButton)
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setting Views
private extension SingUpViewController {
    func setupView() {
        view.backgroundColor = .accentLightBlue
        addSubViews()
        addAction()
        setupLayout()
    }
}
//MARK: - Setting Views
private extension SingUpViewController {
    func addSubViews() {
        view.addSubview(signUpLabel)
        view.addSubview(nameTF)
        view.addSubview(loginTF)
        view.addSubview(passwordTF)
        view.addSubview(conformPasswordTF)
        view.addSubview(myButton)
    }
    
    func addAction () {
        myButton.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
    }
    
    @objc private func selectButtonTapped() {
        let viewControllerToPresent = ViewController()
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        present(viewControllerToPresent, animated: true, completion: nil)
    }
}
//MARK: - Layout
private extension SingUpViewController {
    func setupLayout() {
        signUpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        nameTF.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 40).isActive = true
        nameTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        loginTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 40).isActive = true
        loginTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.topAnchor.constraint(equalTo: loginTF.bottomAnchor, constant: 40).isActive = true
        passwordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        conformPasswordTF.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 40).isActive = true
        conformPasswordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        conformPasswordTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        myButton.topAnchor.constraint(equalTo: conformPasswordTF.bottomAnchor, constant: 80).isActive = true
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
    }
}

