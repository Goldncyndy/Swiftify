//
//  SignupViewController.swift
//  Swiftify
//
//  Created by Cynthia D'Phoenix on 7/30/24.
//

import UIKit


class SignUpViewController: UIViewController {

    private let titleLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let signUpButton = UIButton(type: .system)
    private let noAccountLabel = UILabel()
    private let signInButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        
        // Title Label setup
        titleLabel.text = "Sign Up"
        titleLabel.textColor = .systemPurple
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // Email Text Field Setup
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .none
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.layer.cornerRadius = 25
        emailTextField.autocorrectionType = .no
        emailTextField.backgroundColor = .white
        emailTextField.layer.masksToBounds = true
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = UIColor.gray.cgColor
        // Add padding to the left
                let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: emailTextField.frame.height))
                emailTextField.leftView = paddingView
                emailTextField.leftViewMode = .always
        view.addSubview(emailTextField)
        
        // Password Text Field Setup
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .none
        passwordTextField.layer.cornerRadius = 25
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        // Add padding to the left
                let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: passwordTextField.frame.height))
                passwordTextField.leftView = paddingView2
                passwordTextField.leftViewMode = .always
        view.addSubview(passwordTextField)
        
        // Sign Up Button Setup
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        signUpButton.backgroundColor = .systemPurple
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.layer.cornerRadius = 20
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        // No Account Label Setup
        noAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        noAccountLabel.text = "Don't have an account?"
        noAccountLabel.textColor = .white
        noAccountLabel.font = UIFont.systemFont(ofSize: 16)
        noAccountLabel.textAlignment = .center
        view.addSubview(noAccountLabel)
        
        // Sign In Button Setup
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(.systemPurple, for: .normal)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        view.addSubview(signInButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Title label Constraints
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // Email Text Field Constraints
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            // Password Text Field Constraints
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            // Sign Up Button Constraints
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signUpButton.widthAnchor.constraint(equalToConstant: 100),
            signUpButton.heightAnchor.constraint(equalToConstant: 44),
            
            // No Account Label Constraints
            noAccountLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 30),
            noAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Sign In Button Constraints
            signInButton.topAnchor.constraint(equalTo: noAccountLabel.bottomAnchor, constant: 5),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func signUpButtonTapped() {
        // Handle sign-up logic here
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            // Show an alert for empty fields
            let alert = UIAlertController(title: "Error", message: "Please enter both email and password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        // Proceed with sign-up process
        print("Email: \(email)")
        print("Password: \(password)")
    }
    
    @objc private func signInButtonTapped() {
        // Navigate back to the Sign In screen
        let signinVC = SignInViewController()
        navigationController?.pushViewController(signinVC, animated: true)
    }
}


