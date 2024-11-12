//
//  MenuCollectionViewCell.swift
//  RollApp
//
//  Created by July Belova on 11.11.2024.
//

import Foundation
import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties

    private let dishImageView: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.contentMode = .scaleAspectFill
        element.clipsToBounds = true
        element.image = UIImage(named: ImageName.logo)
        return element
    }()
    
    private let nameLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        element.text = "Main Dishes"
        return element
    }()
  
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with info: DishModel) {
        dishImageView.image = info.image
        nameLabel.text = info.nameOfTheDish
    }
}

extension MenuCollectionViewCell {
    func makeUI() {
        contentView.backgroundColor = .accentLightRed
        contentView.layer.cornerRadius = 35
        contentView.layer.masksToBounds = true

        contentView.addSubview(dishImageView)
        contentView.addSubview(nameLabel)
    
       

        
        
     
        
        NSLayoutConstraint.activate([
            dishImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            dishImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            dishImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            dishImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),
            
            nameLabel.topAnchor.constraint(equalTo: dishImageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
         
            
        ])
    }
}
