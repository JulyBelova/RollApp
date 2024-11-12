//
//  HomeVC.swift
//  RollApp
//
//  Created by July Belova on 08.11.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    //MARK: - Private Property
    private let topImage: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: ImageName.topImage)
        element.tintColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let topLabel: UILabel = {
        let element = UILabel()
        element.text = "Menu"
        element.textAlignment = .center
        element.textColor = .white
        element.font = .boldSystemFont(ofSize: 32)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let titleLabel: UILabel = {
        let element = UILabel()
        element.text = "Еда, приготовленная с любовью. Богатейшие ингредиенты."
        element.textAlignment = .center
        element.numberOfLines = 0
        element.textColor = .white
        element.font = .boldSystemFont(ofSize: 17)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.layer.cornerRadius = 35
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: MenuCollectionViewCell.self))
        
        return collection
    }()
    private var items: [DishModel] = []
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setting Views
private extension HomeViewController {
    func setupView() {
        view.backgroundColor = .accentDarkRed
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        addSubViews()
        addAction()
        setupLayout()
    }
}

//MARK: - Setting
private extension HomeViewController {
    func addSubViews() {
        view.addSubview(topImage)
        view.addSubview(topLabel)
        view.addSubview(titleLabel)
        view.addSubview(menuCollectionView)
    }
    
    func addAction () {
        navigationController?.navigationBar.tintColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: ImageName.menu), style: .done, target: self, action: #selector(selectMenuTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: ImageName.basketLight), style: .done, target: self, action: #selector(selectBasketTapped))
    }
    
    @objc func selectMenuTapped() {
        let viewControllerToPresent = MenuViewController()
        //viewControllerToPresent.modalPresentationStyle = .fullScreen
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    @objc func selectBasketTapped() {
        let viewControllerToPresent = ViewController()
        //viewControllerToPresent.modalPresentationStyle = .fullScreen
        present(viewControllerToPresent, animated: true, completion: nil)
    }
}

//MARK: - Layout
private extension HomeViewController {
    func setupLayout() {
        
        topImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topImage.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        topImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        topLabel.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 10).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
   
        menuCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        menuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        menuCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20).isActive = true
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MenuCollectionViewCell.self), for: indexPath) as! MenuCollectionViewCell
        cell.configure(with: items[indexPath.item])

        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.width * 1.15)
       
    }
}
#Preview("SignInViewController"){
    HomeViewController()
}
