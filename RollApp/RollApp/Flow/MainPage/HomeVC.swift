//
//  HomeVC.swift
//  RollApp
//
//  Created by July Belova on 08.11.2024.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didSelectMenuItem()
}

class HomeViewController: UIViewController {
    
    
    //MARK: - Private Property
    
    weak var delegate: HomeViewControllerDelegate?
    
    private let gradientLayer: CAGradientLayer = {
            let layer = CAGradientLayer()
            layer.colors = [
                UIColor.accentDarkBlue.cgColor,
                UIColor.accentDarkRed.cgColor
            ]
            layer.locations = [0.0, 1.0]
            return layer
        }()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
   
    private let topLabel: UILabel = {
        let element = UILabel()
        element.text = "Menu"
        element.textAlignment = .center
        element.textColor = .accentYellow
        element.font = .boldSystemFont(ofSize: 32)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let titleLabel: UILabel = {
        let element = UILabel()
        element.text = "Еда, приготовленная с любовью!"
        element.textAlignment = .center
        element.textColor = .accentLightRed
        element.font = .boldSystemFont(ofSize: 17)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let searchField = SearchMenuField()
    
    lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.layer.cornerRadius = 35
//        collection.layer.borderWidth = 3
//        collection.layer.borderColor = UIColor.accentBlue.cgColor
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: HomeCollectionViewCell.self))
        
        return collection
    }()
    
    private let myButton = MyButton(buttonText: "Вернись наверх!")
    
    private var items: [DishModel] = [
        DishModel(imageOfTheDish: UIImage(named:"Сет")!, nameOfTheDish: "Сет"),
        DishModel(imageOfTheDish: UIImage(named:"Темпура1")!, nameOfTheDish: "Горячие роллы"),
        DishModel(imageOfTheDish: UIImage(named:"Урамаки10")!, nameOfTheDish: "Холодные роллы"),
        DishModel(imageOfTheDish: UIImage(named:"СладкийРолл")!, nameOfTheDish: "Сладкие роллы"),
        DishModel(imageOfTheDish: UIImage(named:"Мидии")!, nameOfTheDish: "Закуски"),
        DishModel(imageOfTheDish: UIImage(named:"Васаби")!, nameOfTheDish: "Добавки"),
    ]
    // MARK: - Initializers
       init() {
           super.init(nibName: nil, bundle: nil)
       }
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            gradientLayer.frame = view.bounds
        }
}

//MARK: - Setting Views
private extension HomeViewController {
    func setupView() {
        navigationController?.navigationBar.barTintColor = .accentDarkBlue
      
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        addSubViews()
        addAction()
        configureScrollView()
        setupLayout()
    }
}

//MARK: - Setting
private extension HomeViewController {
    func addSubViews() {
        view.layer.addSublayer(gradientLayer)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(topLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(searchField)
        contentView.addSubview(menuCollectionView)
        contentView.addSubview(myButton)
    }
    
    func addAction () {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: ImageName.menu), style: .done, target: self, action: #selector(selectMenuTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: ImageName.basketLight), style: .done, target: self, action: #selector(selectBasketTapped))
        
        myButton.addTarget(self, action: #selector(selectMyButtonTapped), for: .touchUpInside)
    }
    
    @objc func selectMyButtonTapped() {
        
    }
    
    @objc func selectMenuTapped() {
        print("tapped")
        delegate?.didSelectMenuItem()
//        let viewControllerToPresent = MenuViewController()
//        //viewControllerToPresent.modalPresentationStyle = .fullScreen
//        present(viewControllerToPresent, animated: true, completion: nil)
    }
    @objc func selectBasketTapped() {
        let viewControllerToPresent = ViewController()
        //viewControllerToPresent.modalPresentationStyle = .fullScreen
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .clear
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeCollectionViewCell.self), for: indexPath) as! HomeCollectionViewCell
        cell.configure(with: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 30+210+30+22)
    }
}
//MARK: - Layout
private extension HomeViewController {
    func setupLayout() {
        
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        topLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        topLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        searchField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        searchField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        searchField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        searchField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        menuCollectionView.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 30).isActive = true
        menuCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        menuCollectionView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        
        myButton.topAnchor.constraint(equalTo: menuCollectionView.bottomAnchor, constant: 20).isActive = true
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        myButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }
}

#Preview("HomeViewController"){
    HomeViewController()
}
