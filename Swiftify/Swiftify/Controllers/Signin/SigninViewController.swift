//
//  SigninViewController.swift
//  Swiftify
//
//  Created by Cynthia D'Phoenix on 7/30/24.
//

import UIKit


class SignInViewController: UIViewController {

    private let titleLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let signInButton = UIButton(type: .system)
    private let haveAccountLabel = UILabel()
    private let signUpButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        
        // Title Label setup
        titleLabel.text = "Sign In"
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
        
        // Sign In Button Setup
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        signInButton.backgroundColor = .systemPurple
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.layer.cornerRadius = 20
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        view.addSubview(signInButton)
        
        // Have Account Label Setup
        haveAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        haveAccountLabel.text = "Already have an account?"
        haveAccountLabel.font = UIFont.systemFont(ofSize: 16)
        haveAccountLabel.textAlignment = .center
        haveAccountLabel.textColor = .white
        view.addSubview(haveAccountLabel)
        
        // Sign Up Button Setup
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.systemPurple, for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        view.addSubview(signUpButton)
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
            
            // Sign In Button Constraints
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signInButton.widthAnchor.constraint(equalToConstant: 100),
            signInButton.heightAnchor.constraint(equalToConstant: 44),
            
            // Have Account Label Constraints
            haveAccountLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30),
            haveAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Sign Up Button Constraints
            signUpButton.topAnchor.constraint(equalTo: haveAccountLabel.bottomAnchor, constant: 5),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func signInButtonTapped() {
        // Handle sign-in logic here
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            // Show an alert for empty fields
            let alert = UIAlertController(title: "Error", message: "Please enter both email and password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        // Proceed with sign-in process
        print("Email: \(email)")
        print("Password: \(password)")

        // Assume sign-in is successful and navigate to DashboardViewController
        let dashboardVC = ChatViewController()
        navigationController?.pushViewController(dashboardVC, animated: true)
    }

    
    @objc private func signUpButtonTapped() {
        // Navigate to the Sign Up screen
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
        
    }
}
