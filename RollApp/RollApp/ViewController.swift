//
//  ViewController.swift
//  RollApp
//
//  Created by July Belova on 06.11.2024.
//

import UIKit

//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .accentRed
//    }
//
//
//}
//
//class ViewController: UIViewController {
//    
//    private var containerView: UIView!
//    private var viewBG: UIImageView!
//    private var menuTableView: UITableView!
//    
//    private let screen = UIScreen.main.bounds
//    private var menu = false
//    private var home = CGAffineTransform()
//    private var options: [Option] = [
//        Option(title: "Home", segue: "HomeSegue"),
//        Option(title: "Settings", segue: "SettingsSegue"),
//        Option(title: "Profile", segue: "ProfileSegue"),
//        Option(title: "Terms and Conditions", segue: "TermsSegue"),
//        Option(title: "Privacy Policy", segue: "PrivacySegue")
//    ]
//    
//    private struct Option {
//        let title: String
//        let segue: String
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .accentBlue
//        setupUI()
//        
//        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
//        swipeGesture.direction = .right
//        view.addGestureRecognizer(swipeGesture)
//        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
//        view.addGestureRecognizer(tapGesture)
//    }
//    
//    private func setupUI() {
//        view.backgroundColor = .white // Set background color
//        
//        containerView = UIView()
//        containerView.backgroundColor = .systemGray6
//        view.addSubview(containerView)
//        
//        viewBG = UIImageView()
//        viewBG.backgroundColor = .clear
//        containerView.addSubview(viewBG)
//        
//        menuTableView = UITableView()
//        menuTableView.delegate = self
//        menuTableView.dataSource = self
//        menuTableView.backgroundColor = .clear
//        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewCell")
//        containerView.addSubview(menuTableView)
//        
//        home = containerView.transform
//        
//        // Set initial constraints for containerView
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            containerView.topAnchor.constraint(equalTo: view.topAnchor),
//            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//        
//        // Set constraints for viewBG
//        viewBG.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            viewBG.topAnchor.constraint(equalTo: containerView.topAnchor),
//            viewBG.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//            viewBG.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//            viewBG.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
//        ])
//        
//        // Set constraints for menuTableView
//        menuTableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            menuTableView.topAnchor.constraint(equalTo: containerView.topAnchor),
//            menuTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//            menuTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//            menuTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
//        ])
//    }
//    
//    private func showMenu() {
//        containerView.layer.cornerRadius = 40
//        viewBG.layer.cornerRadius = containerView.layer.cornerRadius
//        let x = screen.width * 0.8
//        let originalTransform = containerView.transform
//        let scaledTransform = originalTransform.scaledBy(x: 0.8, y: 0.8)
//        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: x, y: 0)
//        UIView.animate(withDuration: 0.7, animations: {
//            self.containerView.transform = scaledAndTranslatedTransform
//        })
//    }
//    
//    private func hideMenu() {
//        UIView.animate(withDuration: 0.7, animations: {
//            self.containerView.transform = self.home
//            self.containerView.layer.cornerRadius = 0
//            self.viewBG.layer.cornerRadius = 0
//        })
//    }
//    
//    @objc private func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
//        if menu == false && sender.direction == .right {
//            showMenu()
//            menu = true
//        }
//    }
//    
//    @objc private func handleTapGesture(_ sender: UITapGestureRecognizer) {
//        if menu == true {
//            hideMenu()
//            menu = false
//        }
//    }
//}
//
//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return options.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
//        cell.textLabel?.text = options[indexPath.row].title
//        cell.textLabel?.textColor = UIColor(red: 0.6461477876, green: 0.6871469617, blue: 0.6214019656, alpha: 1)
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // Handle segue logic here based on selected option
//        print("Selected: (options[indexPath.row].title)")
//        // You can use performSegue(withIdentifier:, sender:) if needed
//    }
//}
//
//




class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var scrollView: UIScrollView!
    var collectionView: UICollectionView!
    var scrollToTopButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Настройка UIScrollView
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
        view.addSubview(scrollView)

        // Настройка UICollectionView
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 400, height: 400)
        layout.scrollDirection = .vertical

        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 2000), collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        scrollView.addSubview(collectionView)

        // Настройка кнопки
        scrollToTopButton = UIButton(type: .system)
        scrollToTopButton.frame = CGRect(x: (view.bounds.width - 200) / 2, y: 1950, width: 200, height: 50)
        scrollToTopButton.setTitle("Прокрутить вверх", for: .normal)
        scrollToTopButton.addTarget(self, action: #selector(scrollToTop), for: .touchUpInside)

        scrollView.addSubview(scrollToTopButton)
    }

    @objc func scrollToTop() {
        // Прокрутка к началу
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // Количество ячеек
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        // Настройка внешнего вида ячейки
        cell.backgroundColor = UIColor(hue: CGFloat(indexPath.item) / 50.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)

        return cell
    }
}
