//
//  LogoView.swift
//  RollApp
//
//  Created by July Belova on 06.11.2024.
//
import UIKit

//MARK: - LogoView
final class LogoView: UIImageView {
    
    //MARK: - Initializers
    init() {
        super.init(frame: .zero)
        setupLogoView()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func setupLogoView() {
        image = UIImage(named: ImageName.logo)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 15, height: 15)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
