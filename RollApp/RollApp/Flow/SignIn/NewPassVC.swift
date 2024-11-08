//
//  NewPassVC.swift
//  RollApp
//
//  Created by July Belova on 08.11.2024.
//
import UIKit

//MARK: - NewPasswordViewController
final class NewPasswordViewController: UIViewController {
    
    //MARK: - Private Property
    private let logoImageView = LogoView()
    
    private let topLabel: UILabel = {
        let element = UILabel()
        element.text = ConstantsNewPass.topLabel
        element.textAlignment = .center
        element.numberOfLines = 0
        element.textColor = .white
        element.font = .boldSystemFont(ofSize: 18)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let newPassTF = RegisterTextField(placeholder: ConstantsNewPass.newPassTF)
    private let passwordTF = RegisterTextField(placeholder: ConstantsNewPass.passwordTF)
    private let myButton = MyButton(placeholder: ConstantsNewPass.myButton)
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setting Views
private extension NewPasswordViewController {
    func setupView() {
        view.backgroundColor = .accentLightBlue
        addSubViews()
        addAction()
        setupLayout()
    }
}

//MARK: - Setting Views
private extension NewPasswordViewController {
    func addSubViews() {
        view.addSubview(logoImageView)
        view.addSubview(topLabel)
        view.addSubview(newPassTF)
        view.addSubview(passwordTF)
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
private extension NewPasswordViewController {
    func setupLayout() {
        logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        topLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50).isActive = true
        topLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        newPassTF.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 50).isActive = true
        newPassTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newPassTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        passwordTF.topAnchor.constraint(equalTo: newPassTF.bottomAnchor, constant: 50).isActive = true
        passwordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        myButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 50).isActive = true
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
    }
}

