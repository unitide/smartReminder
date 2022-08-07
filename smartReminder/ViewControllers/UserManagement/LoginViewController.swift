//
//  LoginViewController.swift
//  smartReminder
//
//  Created by Mingyong Zhu on 8/5/22.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Properties
    lazy private var userLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.font = UIFont.systemFont(ofSize: 16)

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy private var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy private var userInput: TextFieldWithPadding = {
        let textInput = TextFieldWithPadding()
        textInput.placeholder = "username"
        textInput.autocapitalizationType = .none
        textInput.font = UIFont.systemFont(ofSize: 16)

        textInput.layer.cornerRadius = 2
        textInput.layer.borderWidth = 3
        textInput.layer.borderColor = UIColor.blue.cgColor

        textInput.translatesAutoresizingMaskIntoConstraints = false
        return textInput
    }()

    lazy private var passwordInput: TextFieldWithPadding = {
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

    lazy private var login: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.titleLabel?.textColor = .blue
        button.backgroundColor = .green

        button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)

        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(userLogin), for: .touchUpInside)
        return button
    }()

    lazy private var register: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.titleLabel?.textColor = .blue
        button.backgroundColor = .cyan
        button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)

        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(userRegister), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "User Login"
        setupUI()
    }

    // MARK: - Private Methods
    private func setupUI() {
        let userNameStackView = UIStackView()
        userNameStackView.axis = .horizontal
        userNameStackView.spacing = 10
        userNameStackView.distribution = .equalSpacing
        userNameStackView.translatesAutoresizingMaskIntoConstraints = false
        userNameStackView.addArrangedSubview(userLabel)
        userNameStackView.addArrangedSubview(userInput)

        userLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        userInput.widthAnchor.constraint(equalToConstant: 150).isActive = true

        let passwordStackView = UIStackView()
        passwordStackView.axis = .horizontal
        passwordStackView.spacing = 10
        passwordStackView.distribution = .equalSpacing
        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        passwordStackView.addArrangedSubview(passwordLabel)
        passwordStackView.addArrangedSubview(passwordInput)
        passwordLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        passwordInput.widthAnchor.constraint(equalToConstant: 150).isActive = true

        let actionStackView = UIStackView()
        actionStackView.axis = .horizontal
        actionStackView.spacing = 10
        actionStackView.distribution = .equalCentering
        actionStackView.translatesAutoresizingMaskIntoConstraints = false
        actionStackView.addArrangedSubview(login)
        actionStackView.addArrangedSubview(register)

       // login.leadingAnchor.constraint(equalTo: actionStackView.leadingAnchor, constant: 10).isActive = true
      //  register.trailingAnchor.constraint(equalTo: actionStackView.trailingAnchor, constant: 10).isActive = true

        login.widthAnchor.constraint(equalToConstant: 100).isActive = true
        register.widthAnchor.constraint(equalToConstant: 100).isActive = true

        let containerStackView = UIStackView()
        containerStackView.axis = .vertical
        containerStackView.spacing = 10
        containerStackView.distribution = .equalSpacing
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.addArrangedSubview(userNameStackView)
        containerStackView.addArrangedSubview(passwordStackView)
        containerStackView.addArrangedSubview(actionStackView)

        let safeArea = view.safeAreaLayoutGuide
        self.view.addSubview(containerStackView)
        containerStackView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        containerStackView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: -50).isActive = true
    }

    // MARK: - Objc Methods
    @objc private func userLogin() {
        let defaults = UserDefaults.standard
        if let userName = userInput.text, let password = passwordInput.text {
            if let savedPassword = defaults.value(forKey: userName) as? String, savedPassword == password {
                defaults.setValue(true, forKey: "login")
                defaults.setValue(userName, forKey: "currentUser")
                let tabBarController = TabBarController()
                tabBarController.modalPresentationStyle = .fullScreen
                present(tabBarController, animated: true)
            } else {
                let alert = UIAlertController(title: "Error", message: "Username and password don't match!",
                                              preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .cancel)
                alert.addAction(alertAction)
                self.present(alert, animated: true)
            }
        }
    }

    @objc private func userRegister() {
        let userRegisterViewController = UserRegisterViewController()
        userRegisterViewController.modalPresentationStyle = .fullScreen
        userRegisterViewController.delegate = self
        self.present(userRegisterViewController, animated: true)
    }
}

extension LoginViewController: UserRegisterViewControllerProtocol {
    func userRegistrationResult(username: String, password: String) {
        userInput.text = username
        passwordInput.text = password
    }
}
