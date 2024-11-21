//
//  HomeCollectionViewCell.swift
//  RollApp
//
//  Created by July Belova on 11.11.2024.
//

import Foundation
import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties

    private let dishImageView: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.contentMode = .scaleAspectFill
        element.clipsToBounds = true
        element.layer.cornerRadius = 27
        element.layer.borderWidth = 3
        element.layer.borderColor = UIColor.accentDarkRed.cgColor
        return element
    }()
    
    private let nameLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        element.textColor = .accentYellow
        return element
    }()
  
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with info: DishModel) {
        dishImageView.image = info.imageOfTheDish
        nameLabel.text = info.nameOfTheDish
    }
}

extension HomeCollectionViewCell {
    func setupCell() {
        contentView.backgroundColor = .white.withAlphaComponent(0.1)
        contentView.layer.cornerRadius = 27
        contentView.layer.masksToBounds = true

        contentView.addSubview(dishImageView)
        contentView.addSubview(nameLabel)
    
        NSLayoutConstraint.activate([
            dishImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27),
            dishImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 27),
            dishImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -27),
            dishImageView.heightAnchor.constraint(equalToConstant: 210),
            
            nameLabel.topAnchor.constraint(equalTo: dishImageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 54),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
        ])
    }
}
//#Preview("MenuCollectionViewCell"){
//    MenuCollectionViewCell()
//}
