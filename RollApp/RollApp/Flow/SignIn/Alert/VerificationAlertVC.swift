//
//  VerificationAlertVC.swift
//  RollApp
//
//  Created by July Belova on 08.11.2024.
//
import UIKit

final class VerificationAlertVC: UIViewController {
    
    //MARK: - Private Property
    private let alertView: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .accentLightBlue
        element.layer.cornerRadius = 10
        return element
    }()
    
    private let titleLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = ConstantsAlert.titleLabel
        element.textColor = .accentDarkBlue
        element.font = UIFont.boldSystemFont(ofSize: 20)
        return element
    }()
    
    private let smallTitleLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = ConstantsAlert.smallTitleLabel
        element.textColor = .white
        element.font = UIFont.boldSystemFont(ofSize: 12)
        return element
    }()
    
    private let emailTextField = RegisterTextField(placeholder: ConstantsAlert.titleLabel)
    private let resetButton = MyButton(buttonText: ConstantsAlert.resetButton)
    
    private let changeButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setTitle(ConstantsAlert.changeButton, for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        return element
    }()
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}
//MARK: - Setting Views
private extension VerificationAlertVC {
    func setupView() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        addSubViews()
        addAction()
        setupLayout()
    }
}
    //MARK: - Setting Views
private extension VerificationAlertVC {
    func addSubViews() {
        view.addSubview(alertView)
        alertView.addSubview(titleLabel)
        alertView.addSubview(smallTitleLabel)
        alertView.addSubview(emailTextField)
        alertView.addSubview(resetButton)
        alertView.addSubview(changeButton)
    }
    func addAction () {
        resetButton.addTarget(self, action: #selector(resetPassword), for: .touchUpInside)
        changeButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
    }
    @objc func resetPassword() {
        print("Reset password for email: \(emailTextField.text ?? "")")
        let viewControllerToPresent = NewPasswordViewController()
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        present(viewControllerToPresent, animated: true, completion: nil)
        
    }
    @objc func dismissAlert() {
        self.dismiss(animated: true, completion: nil)
    }
}
//MARK: - Layout
private extension VerificationAlertVC {
    func setupLayout() {
        NSLayoutConstraint.activate([
            alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            alertView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45),
            
            titleLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            
            smallTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            smallTitleLabel.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: smallTitleLabel.bottomAnchor, constant: 20),
            emailTextField.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalTo: alertView.widthAnchor, multiplier: 0.8),
            
            resetButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            resetButton.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            resetButton.widthAnchor.constraint(equalTo: alertView.widthAnchor, multiplier: 0.6),
            
            changeButton.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: 20),
            changeButton.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
        ])
    }
}

