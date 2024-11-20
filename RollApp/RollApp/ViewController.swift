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

class ViewController: UIViewController {
    
    private var containerView: UIView!
    private var viewBG: UIImageView!
    private var menuTableView: UITableView!
    
    private let screen = UIScreen.main.bounds
    private var menu = false
    private var home = CGAffineTransform()
    private var options: [Option] = [
        Option(title: "Home", segue: "HomeSegue"),
        Option(title: "Settings", segue: "SettingsSegue"),
        Option(title: "Profile", segue: "ProfileSegue"),
        Option(title: "Terms and Conditions", segue: "TermsSegue"),
        Option(title: "Privacy Policy", segue: "PrivacySegue")
    ]
    
    private struct Option {
        let title: String
        let segue: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .accentBlue
        setupUI()
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeGesture.direction = .right
        view.addGestureRecognizer(swipeGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupUI() {
        view.backgroundColor = .white // Set background color
        
        containerView = UIView()
        containerView.backgroundColor = .systemGray6
        view.addSubview(containerView)
        
        viewBG = UIImageView()
        viewBG.backgroundColor = .clear
        containerView.addSubview(viewBG)
        
        menuTableView = UITableView()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.backgroundColor = .clear
        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        containerView.addSubview(menuTableView)
        
        home = containerView.transform
        
        // Set initial constraints for containerView
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Set constraints for viewBG
        viewBG.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewBG.topAnchor.constraint(equalTo: containerView.topAnchor),
            viewBG.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            viewBG.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            viewBG.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        // Set constraints for menuTableView
        menuTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuTableView.topAnchor.constraint(equalTo: containerView.topAnchor),
            menuTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            menuTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            menuTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    private func showMenu() {
        containerView.layer.cornerRadius = 40
        viewBG.layer.cornerRadius = containerView.layer.cornerRadius
        let x = screen.width * 0.8
        let originalTransform = containerView.transform
        let scaledTransform = originalTransform.scaledBy(x: 0.8, y: 0.8)
        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: x, y: 0)
        UIView.animate(withDuration: 0.7, animations: {
            self.containerView.transform = scaledAndTranslatedTransform
        })
    }
    
    private func hideMenu() {
        UIView.animate(withDuration: 0.7, animations: {
            self.containerView.transform = self.home
            self.containerView.layer.cornerRadius = 0
            self.viewBG.layer.cornerRadius = 0
        })
    }
    
    @objc private func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        if menu == false && sender.direction == .right {
            showMenu()
            menu = true
        }
    }
    
    @objc private func handleTapGesture(_ sender: UITapGestureRecognizer) {
        if menu == true {
            hideMenu()
            menu = false
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        cell.textLabel?.text = options[indexPath.row].title
        cell.textLabel?.textColor = UIColor(red: 0.6461477876, green: 0.6871469617, blue: 0.6214019656, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle segue logic here based on selected option
        print("Selected: (options[indexPath.row].title)")
        // You can use performSegue(withIdentifier:, sender:) if needed
    }
}


