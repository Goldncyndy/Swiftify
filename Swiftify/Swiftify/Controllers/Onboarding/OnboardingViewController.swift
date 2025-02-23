//
//  OnboardingViewController.swift
//  Swiftify
//
//  Created by Cynthia D'Phoenix on 7/30/24.
//

import UIKit

class OnboardingViewController: UIViewController {

    private let imageView = UIImageView()
    private let darkOverlayView = UIView()
    private let titleLabel = UILabel()
    private let pageTitleLabel = UILabel()
    private let descriptionLabel = UILabel()
    let skipButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = .white

        // Image View Setup
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "bot3")
        view.addSubview(imageView)

        // Dark Overlay View Setup
        darkOverlayView.translatesAutoresizingMaskIntoConstraints = false
        darkOverlayView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        view.addSubview(darkOverlayView)
        
        // Page Title Label Setup
        pageTitleLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        pageTitleLabel.textColor = .systemPurple
        pageTitleLabel.textAlignment = .center
        pageTitleLabel.text = "SwiftIfy"
        pageTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageTitleLabel)

        // Title Label Setup
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Ask AI anything and get instant and well organised answers"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)

        // Description Label Setup
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Don't be shy"
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        view.addSubview(descriptionLabel)
        
        // skip button setup
        skipButton.setTitle("Let's go", for: .normal)
        skipButton.tintColor = .white
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        view.addSubview(skipButton)

        // Constraints
        NSLayoutConstraint.activate([
            
            // Skip Button Constraints
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Image View Constraints
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Page Title Label Constraints
            pageTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            pageTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Dark Overlay View Constraints
            darkOverlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            darkOverlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            darkOverlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            darkOverlayView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),

            // Title Label Constraints
            titleLabel.topAnchor.constraint(equalTo: darkOverlayView.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            // Description Label Constraints
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
       
        ])
    }
    
    
    @objc func skipButtonTapped() {
        
        let signinVC = SignInViewController()
        navigationController?.pushViewController(signinVC, animated: true)
        
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
               
//        let navigationController = UINavigationController(rootViewController: signupVC)
//        UIApplication.shared.windows.first?.rootViewController = navigationController
          
    }
}

