//
//  UserRegisterViewController.swift
//  smartReminder
//
//  Created by Mingyong Zhu on 8/7/22.
//

import UIKit

class UserRegisterViewController: UIViewController {
    // MARK: - Properties
    weak var delegate: UserRegisterViewControllerProtocol?

    // MARK: - User Views
    lazy private var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.font = UIFont.systemFont(ofSize: 16)

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy private var usernameInput: TextFieldWithPadding = {
        let textInput = TextFieldWithPadding()
        textInput.placeholder = "username"
        textInput.autocapitalizationType = .none
        textInput.font = UIFont.systemFont(ofSize: 16)

        textInput.layer.borderWidth = 3
        textInput.layer.borderColor = UIColor.blue.cgColor
        textInput.layer.cornerRadius = 2

        textInput.translatesAutoresizingMaskIntoConstraints = false

        return textInput
    }()

    lazy private var password1Label: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy private var password1Input: TextFieldWithPadding = {
        let textInput = TextFieldWithPadding()
        textInput.placeholder = "password"
        textInput.autocapitalizationType = .none
        textInput.isSecureTextEntry = true
        textInput.font = UIFont.systemFont(ofSize: 16)
        textInput.layer.cornerRadius = 2
        textInput.layer.borderWidth = 3

        textInput.layer.borderColor = UIColor.blue.cgColor
        textInput.translatesAutoresizingMaskIntoConstraints = false
        return textInput
    }()

    lazy private var password2Label: UILabel = {
        let label = UILabel()
        label.text = "Re-Password"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy private var password2Input: TextFieldWithPadding = {
        let textInput = TextFieldWithPadding()
        textInput.placeholder = "Re-password"
        textInput.autocapitalizationType = .none
        textInput.isSecureTextEntry = true
        textInput.font = UIFont.systemFont(ofSize: 16)
        textInput.layer.cornerRadius = 2
        textInput.layer.borderWidth = 3

        textInput.layer.borderColor = UIColor.blue.cgColor
        textInput.translatesAutoresizingMaskIntoConstraints = false
        return textInput
    }()

    lazy private var register: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.titleLabel?.textColor = .black
        button.backgroundColor = .cyan
        button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)

        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(userRegister), for: .touchUpInside)
        return button
    }()

    lazy private var cancel: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.titleLabel?.textColor = .black
        button.backgroundColor = .cyan
        button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)

        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(userCancel), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle 

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupUI()

        // Do any additional setup after loading the view.
    }

    // MARK: - Private Methods
    private func setupUI() {
        // Username label and input
        let usernameStackView = UIStackView()
        usernameStackView.axis = .horizontal
        usernameStackView.distribution = .equalCentering
        usernameStackView.spacing = 10
        usernameStackView.translatesAutoresizingMaskIntoConstraints = false

        usernameStackView.addArrangedSubview(usernameLabel)
        usernameStackView.addArrangedSubview(usernameInput)

        usernameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        usernameInput.widthAnchor.constraint(equalToConstant: 150).isActive = true

        // Password1 label and input
        let password1StackView = UIStackView()
        password1StackView.axis = .horizontal
        password1StackView.distribution = .equalCentering
        password1StackView.spacing = 10
        password1StackView.translatesAutoresizingMaskIntoConstraints = false

        password1StackView.addArrangedSubview(password1Label)
        password1StackView.addArrangedSubview(password1Input)

        password1Label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        password1Input.widthAnchor.constraint(equalToConstant: 150).isActive = true

        // Password2 label and input
        let password2StackView = UIStackView()
        password2StackView.axis = .horizontal
        password2StackView.distribution = .equalCentering
        password2StackView.spacing = 10
        password2StackView.translatesAutoresizingMaskIntoConstraints = false

        password2StackView.addArrangedSubview(password2Label)
        password2StackView.addArrangedSubview(password2Input)

        password2Label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        password2Input.widthAnchor.constraint(equalToConstant: 150).isActive = true

        // Action register and cancel
        let actionStackView = UIStackView()
        actionStackView.axis = .horizontal
        actionStackView.spacing = 10
        actionStackView.distribution = .equalCentering
        actionStackView.translatesAutoresizingMaskIntoConstraints = false
        actionStackView.addArrangedSubview(register)
        actionStackView.addArrangedSubview(cancel)

        cancel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        register.widthAnchor.constraint(equalToConstant: 100).isActive = true

        // Container
        let containerStackView = UIStackView()
        containerStackView.axis = .vertical
        containerStackView.spacing = 10
        containerStackView.distribution = .equalSpacing
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.addArrangedSubview(usernameStackView)
        containerStackView.addArrangedSubview(password1StackView)
        containerStackView.addArrangedSubview(password2StackView)
        containerStackView.addArrangedSubview(actionStackView)

        let safeArea = view.safeAreaLayoutGuide
        self.view.addSubview(containerStackView)
        containerStackView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        containerStackView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: -50).isActive = true

    }
    @objc private func userRegister() {
        if let username = usernameInput.text, let password1Input = password1Input.text,
           let password2Input = password2Input.text {
            guard password1Input == password2Input else {
                let alert = UIAlertController(title: "Error", message: "You entered different password!",
                                              preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .cancel)
                alert.addAction(alertAction)
                self.present(alert, animated: true)
                return
            }

            let defaults = UserDefaults.standard
            if let _ = defaults.value(forKey: username) as? String {
                let alert = UIAlertController(title: "Error",
                                              message: "The user name exists, please choose another one!",
                                              preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .cancel)
                alert.addAction(alertAction)
                self.present(alert, animated: true)
                return
            } else {
                defaults.setValue(password1Input, forKey: username)
                delegate?.userRegistrationResult(username: username, password: password1Input)
                self.dismiss(animated: true)
            }
        }
    }

    @objc private func userCancel() {
        self.dismiss(animated: true)
    }
}

protocol UserRegisterViewControllerProtocol: AnyObject {
    func userRegistrationResult(username: String, password: String)
}
