//
//  LoginViewController.swift
//  Mobilium
//
//  Created by Kerem Demır on 26.05.2023.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - UI Elements
    var name: String?
    var password: String?
    
    public lazy var nameTextField: UITextField = {
        let nameTextField = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: nameTextField.frame.height))
        nameTextField.leftView = paddingView
        nameTextField.leftViewMode = .always
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.attributedPlaceholder = "Name".toAttributed(alignment: .center)
        nameTextField.autocorrectionType = .no
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = UIColor.darkGray.cgColor
        nameTextField.layer.cornerRadius = 10
        return nameTextField
    }()
    
    public lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: passwordTextField.frame.height))
        passwordTextField.leftView = paddingView
        passwordTextField.leftViewMode = .always
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.attributedPlaceholder = "Password".toAttributed(alignment: .center)
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.darkGray.cgColor
        passwordTextField.layer.cornerRadius = 10
        return passwordTextField
    }()
    
    private lazy var loginButton:UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        loginButton.backgroundColor = .systemGreen
        loginButton.isEnabled = true
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 10
        return loginButton
    }()
    
    
    //MARK: - Properties
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Login"
        
        configure()
    }
    
    //MARK: - Functions
    
    private func configure(){
        addConstraints()
        hideKeyboardWhenTappedAround()
//        checkForValidForm()
    }
    
    private func addConstraints(){
        view.addSubViews(nameTextField, passwordTextField, loginButton)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            nameTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            nameTextField.widthAnchor.constraint(equalToConstant: 300),
            
            passwordTextField.topAnchor.constraint(equalTo: nameTextField.safeAreaLayoutGuide.topAnchor, constant: 70),
            passwordTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.safeAreaLayoutGuide.topAnchor, constant: 100),
            loginButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func loginRules(){
        let moviesVC = MovieListViewController()
        
        if (name == nameTextField.text && password == passwordTextField.text){
            navigationController?.pushViewController(moviesVC, animated: true)
        }
        else {
            let alertController = UIAlertController(title: "Wrong.", message: "Name or password is incorrect.", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Try Again", style: .default) { [self] _ in
                nameTextField.text = ""
                passwordTextField.text = ""
            }
            alertController.addAction(action)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                
            }
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    //MARK: - Actions
    
    @objc func loginTapped(){
        loginRules()
    }
}
