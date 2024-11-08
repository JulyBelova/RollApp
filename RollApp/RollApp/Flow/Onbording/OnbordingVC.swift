//
//  OnbordingVC.swift
//  RollApp
//
//  Created by July Belova on 06.11.2024.
//
import UIKit

//MARK: - OnboardingViewController
final class OnboardingViewController: UIViewController {
    
    //MARK: - Private Property
    private let topLabel: UILabel = {
        let element = UILabel()
        element.text = ConstantsOnboarding.topLabel
        element.textAlignment = .center
        element.numberOfLines = 0
        element.textColor = .accentLightBlue
        element.font = .boldSystemFont(ofSize: 20)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let logoImageView = LogoView()
    private let arrowButton = MyButton(placeholder: " ")
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setting Views
private extension OnboardingViewController {
    func setupView() {
        view.backgroundColor = .accentDarkBlue
        addSubViews()
        addAction()
        setupLayout()
    }
}

//MARK: - Setting
private extension OnboardingViewController {
    func addSubViews() {
        view.addSubview(logoImageView)
        view.addSubview(topLabel)
        view.addSubview(arrowButton)
    }
    
    func addAction () {
        arrowButton.backgroundColor = .accentBlue
        arrowButton.tintColor = .accentLightYellow
        arrowButton.setImage(UIImage(systemName: SystemImageName.arrowRight), for: .normal)
        arrowButton.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
    }
    
    @objc private func selectButtonTapped() {
        let viewControllerToPresent = SignInViewController()
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        present(viewControllerToPresent, animated: true, completion: nil)
    }
}

//MARK: - Layout
private extension OnboardingViewController {
    func setupLayout() {
        logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        topLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50).isActive = true
        topLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        arrowButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        arrowButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        arrowButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
    }
}
