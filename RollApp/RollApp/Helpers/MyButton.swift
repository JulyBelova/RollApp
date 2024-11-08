//
//  MyButton.swift
//  RollApp
//
//  Created by July Belova on 06.11.2024.
//
import UIKit

class MyButton: UIButton {
    
    //MARK: - Initializers
    init(placeholder: String) {
        super.init(frame: .zero)
        setupMyButton(placeholder: placeholder)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func setupMyButton(placeholder: String) {
        setTitle(placeholder, for: .normal)
        backgroundColor = .accentLightRed
        tintColor = .white
        titleLabel?.font = UIFont.systemFont(ofSize: 17)
        layer.cornerRadius = 25
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 15, height: 15)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
