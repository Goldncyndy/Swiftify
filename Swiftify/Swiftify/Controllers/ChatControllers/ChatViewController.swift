//
//  ChatViewController.swift
//  Swiftify
//
//  Created by Cynthia D'Phoenix on 7/30/24.
//

import UIKit

class ChatViewController: UIViewController {

    private let titleLabel = UILabel()
    private let topView = UIView()
    private let chatInputTextField = UITextField()
    private let bottomView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupKeyboardNotifications()
        setupTapGestureToDismissKeyboard()
    }

    private func setupViews() {
        view.backgroundColor = .black

        // Title Label setup
        titleLabel.text = "Chat"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        topView.addSubview(titleLabel)

        // Top View Setup
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .systemPurple
        view.addSubview(topView)

        // Chat Input Text Field Setup
        chatInputTextField.translatesAutoresizingMaskIntoConstraints = false
        chatInputTextField.placeholder = "Enter text"
        chatInputTextField.borderStyle = .none
        chatInputTextField.keyboardType = .default
        chatInputTextField.autocapitalizationType = .none
        chatInputTextField.layer.cornerRadius = 25
        chatInputTextField.autocorrectionType = .no
        chatInputTextField.backgroundColor = .clear
        chatInputTextField.layer.masksToBounds = true
        chatInputTextField.layer.borderWidth = 1.0
        chatInputTextField.layer.borderColor = UIColor.gray.cgColor
        chatInputTextField.textColor = .white

        // Add padding to the left
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: chatInputTextField.frame.height))
        chatInputTextField.leftView = paddingView
        chatInputTextField.leftViewMode = .always

        // Add Send Button to the right with padding
        // Add Send Button to the right with padding
        let sendButtonContainer = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
        let sendButton = UIButton(type: .system)
        sendButton.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        sendButton.tintColor = .systemPurple // Ensure the icon is visible
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        sendButton.frame = CGRect(x: 10, y: 0, width: 40, height: 44) // Ensure the button's frame is set properly
        sendButtonContainer.addSubview(sendButton)
        chatInputTextField.rightView = sendButtonContainer
        chatInputTextField.rightViewMode = .always

        bottomView.addSubview(chatInputTextField)

        // Bottom View Setup
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = .veryDarkGray
        view.addSubview(bottomView)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Title label Constraints
            titleLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: -30),
            titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),

            // Top View Constraints
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 100),

            // Chat Input Text Field Constraints
            chatInputTextField.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            chatInputTextField.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
            chatInputTextField.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20),
            chatInputTextField.heightAnchor.constraint(equalToConstant: 44),

            // Bottom View Constraints
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    @objc private func sendButtonTapped() {
        // Action for the send button
        print("Send button tapped")
    }

    // MARK: - Keyboard Handling

    private func setupKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        view.frame.origin.y = -keyboardFrame.height
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }

    private func setupTapGestureToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
