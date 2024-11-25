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
        element.layer.cornerRadius = 26
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
        dishImageView.image = info.dishTypeImage
        nameLabel.text = info.dishTypeName
    }
}

extension HomeCollectionViewCell {
    func setupCell() {
        contentView.backgroundColor = .black.withAlphaComponent(0.2)
        contentView.layer.cornerRadius = 27
        contentView.layer.masksToBounds = true

        contentView.addSubview(dishImageView)
        contentView.addSubview(nameLabel)
    
        NSLayoutConstraint.activate([
            dishImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            dishImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            dishImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            dishImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 54),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
}
//#Preview("MenuCollectionViewCell"){
//    MenuCollectionViewCell()
//}
