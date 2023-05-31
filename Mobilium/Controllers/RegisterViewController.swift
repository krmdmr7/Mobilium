//
//  ViewController.swift
//  Mobilium
//
//  Created by Kerem Demır on 26.05.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: - UI Elements
    private var invalidEmailBool: Bool = true
    private var invalidNameBool: Bool = true
    private var invalidPasswordBool: Bool = true
    private var invalidReTypePasswordBool: Bool = true
    private var invalidCheckPasswordBool: Bool = true
    private var textFieldsIsEmpty: Bool = true
    
    private let textFieldsAreFullLabel:UILabel = {
        let textFieldsAreFullLabel = UILabel()
        textFieldsAreFullLabel.translatesAutoresizingMaskIntoConstraints = false
        textFieldsAreFullLabel.text = "• Fill in all fields."
        textFieldsAreFullLabel.textColor = .systemRed
        return textFieldsAreFullLabel
    }() // Text: Fill in all fields.
    
    private let matchPasswordError:UILabel = {
        let matchPasswordError = UILabel()
        matchPasswordError.translatesAutoresizingMaskIntoConstraints = false
        matchPasswordError.text = "• Passwords match."
        matchPasswordError.textColor = .systemRed
        return matchPasswordError
    }()
    
    private let nameError:UILabel = {
        let nameAndPasswordError = UILabel()
        nameAndPasswordError.translatesAutoresizingMaskIntoConstraints = false
        nameAndPasswordError.text = "• Name minimum 3 characters."
        nameAndPasswordError.textColor = .systemRed
        return nameAndPasswordError
    }()
    
    private let passwordError:UILabel = {
        let passwordError = UILabel()
        passwordError.translatesAutoresizingMaskIntoConstraints = false
        passwordError.text = "• Password minimum 3 characters."
        passwordError.textColor = .systemRed
        return passwordError
    }()
    
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
        nameTextField.addTarget(self, action: #selector(RegisterViewController.nameChanged(_:)), for: .editingChanged)
        return nameTextField
    }()
    
    public lazy var mailTextField: UITextField = {
        let mailTextField = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: mailTextField.frame.height))
        mailTextField.leftView = paddingView
        mailTextField.leftViewMode = .always
        mailTextField.translatesAutoresizingMaskIntoConstraints = false
        mailTextField.attributedPlaceholder = "e-mail".toAttributed(alignment: .center)
        mailTextField.addLowerCaseKeyboard()
        mailTextField.autocorrectionType = .no
        mailTextField.layer.borderWidth = 1
        mailTextField.layer.borderColor = UIColor.darkGray.cgColor
        mailTextField.layer.cornerRadius = 10
        mailTextField.addTarget(self, action: #selector(RegisterViewController.emailChanged(_:)), for: .editingChanged)
        return mailTextField
    }()
    
    public lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: passwordTextField.frame.height))
        passwordTextField.leftView = paddingView
        passwordTextField.leftViewMode = .always
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.attributedPlaceholder = "Password".toAttributed(alignment: .center)
        passwordTextField.autocorrectionType = .no
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.darkGray.cgColor
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.addTarget(self, action: #selector(RegisterViewController.passwordChanged(_:)), for: .editingChanged)
        return passwordTextField
    }()
    
    private lazy var reTypePasswordTextField: UITextField = {
        let reTypePasswordTextField = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: reTypePasswordTextField.frame.height))
        reTypePasswordTextField.leftView = paddingView
        reTypePasswordTextField.leftViewMode = .always
        reTypePasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        reTypePasswordTextField.attributedPlaceholder = "Re-Type Password".toAttributed(alignment: .center)
        reTypePasswordTextField.autocorrectionType = .no
        reTypePasswordTextField.layer.borderWidth = 1
        reTypePasswordTextField.layer.borderColor = UIColor.darkGray.cgColor
        reTypePasswordTextField.layer.cornerRadius = 10
        reTypePasswordTextField.addTarget(self, action: #selector(reTypePasswordChanged(_:)), for: .editingChanged)
        return reTypePasswordTextField
    }()
    
    private lazy var registerButton:UIButton = {
        let registerButton = UIButton()
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.backgroundColor = .systemRed
        registerButton.isEnabled = false
        registerButton.setTitle("Register", for: .normal)
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        registerButton.layer.cornerRadius = 10
        return registerButton
    }()
    
    //MARK: - Properties
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        title = "Register"
        
        configure()
    }
    
    //MARK: - Functions
    
    private func configure(){
        addConstraints()
        hideKeyboardWhenTappedAround()
    }
    
    private func addConstraints(){
        view.addSubViews(nameTextField,
                         mailTextField,
                         passwordTextField,
                         reTypePasswordTextField,
                         registerButton,
                         textFieldsAreFullLabel,
                         nameError,
                         passwordError,
                         matchPasswordError)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            nameTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            nameTextField.widthAnchor.constraint(equalToConstant: 300),
            
            mailTextField.topAnchor.constraint(equalTo: nameTextField.safeAreaLayoutGuide.topAnchor, constant: 70),
            mailTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mailTextField.heightAnchor.constraint(equalToConstant: 50),
            mailTextField.widthAnchor.constraint(equalToConstant: 300),
            
            passwordTextField.topAnchor.constraint(equalTo: mailTextField.safeAreaLayoutGuide.topAnchor, constant: 70),
            passwordTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            
            reTypePasswordTextField.topAnchor.constraint(equalTo: passwordTextField.safeAreaLayoutGuide.topAnchor, constant: 70),
            reTypePasswordTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            reTypePasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            reTypePasswordTextField.widthAnchor.constraint(equalToConstant: 300),
            
            registerButton.topAnchor.constraint(equalTo: reTypePasswordTextField.safeAreaLayoutGuide.topAnchor, constant: 100),
            registerButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            registerButton.widthAnchor.constraint(equalToConstant: 200),
            
            
            textFieldsAreFullLabel.topAnchor.constraint(equalTo: registerButton.safeAreaLayoutGuide.topAnchor, constant: 130),
            textFieldsAreFullLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            textFieldsAreFullLabel.heightAnchor.constraint(equalToConstant: 40),
            textFieldsAreFullLabel.widthAnchor.constraint(equalToConstant: 300),
            
            
            matchPasswordError.topAnchor.constraint(equalTo: textFieldsAreFullLabel.safeAreaLayoutGuide.topAnchor, constant: 30),
            matchPasswordError.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            matchPasswordError.heightAnchor.constraint(equalToConstant: 40),
            matchPasswordError.widthAnchor.constraint(equalToConstant: 300),
            
            
            nameError.topAnchor.constraint(equalTo: matchPasswordError.safeAreaLayoutGuide.topAnchor, constant: 30),
            nameError.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            nameError.heightAnchor.constraint(equalToConstant: 40),
            nameError.widthAnchor.constraint(equalToConstant: 300),
            
            passwordError.topAnchor.constraint(equalTo: nameError.safeAreaLayoutGuide.topAnchor, constant: 30),
            passwordError.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            passwordError.heightAnchor.constraint(equalToConstant: 40),
            passwordError.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    //MARK: - Form Validations
    
    @objc func nameChanged(_ sender: Any){
        if let name = nameTextField.text {
            if invalidName(name) != nil {
            }
        }
    }
    
    private func invalidName(_ value: String) -> String? {
        if value.count > 2 {
            invalidNameBool = false
            nameError.textColor = .systemGreen
            
            checkForValidForm()
        }
        else {
            invalidNameBool = true
        }
        return nil
    }
    
    @objc func emailChanged(_ sender: Any){
        if let email = mailTextField.text {
            if invalidEmail(email) != nil {
            }
        }
    }
    
    private func invalidEmail(_ value: String) -> String? {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value) {
            invalidEmailBool = true
            
            return "Invalid Email Adress."
        }
        else {
            invalidEmailBool = false
            
            checkForValidForm()
        }
        return nil
    }
    
    @objc func passwordChanged(_ sender: Any){
        if let password = passwordTextField.text {
            if invalidPassword(password) != nil {
                
            }
        }
    }
    
    @objc func reTypePasswordChanged(_ sender: Any){
        if let password = reTypePasswordTextField.text {
            if invalidReTypePassword(password) != nil {
                
            }
        }
    }
    
    private func invalidPassword(_ value: String) -> String? {
        if value.count > 2 {
            invalidPasswordBool = false
            passwordError.textColor = .systemGreen
            
            checkForValidForm()
        }
        else {
            invalidPasswordBool = true
        }
        return nil
    }
    
    private func invalidReTypePassword(_ value: String) -> String? {
        if value.count > 2 {
            invalidReTypePasswordBool = false
            
            // For Password Matcg
            if (passwordTextField.text == reTypePasswordTextField.text) {
                matchPasswordError.textColor = .systemGreen
                invalidCheckPasswordBool = false
                
                checkForValidForm()
            }
        }
        else {
            invalidReTypePasswordBool = true
        }
        return nil
    }
    
    private func checkForValidForm(){
        if (nameTextField.text?.isEmpty != true && mailTextField.text?.isEmpty != true && passwordTextField.text?.isEmpty != true && reTypePasswordTextField.text?.isEmpty != true) {
            textFieldsAreFullLabel.textColor = .systemGreen
            textFieldsIsEmpty = false
        }
        
        if (invalidNameBool == false && invalidEmailBool == false && invalidPasswordBool == false && invalidCheckPasswordBool == false && textFieldsIsEmpty == false ) {
            registerButton.backgroundColor = .systemGreen
            registerButton.isEnabled = true
            print("Her sey dolu ve buton aktif.")
        }
    }
    
    //MARK: - Actions
    @objc func registerTapped(){
        let loginViewController = LoginViewController()
        
        loginViewController.name = nameTextField.text
        loginViewController.password = passwordTextField.text
        
        navigationController?.pushViewController(loginViewController, animated: true)
        
        
        print("Name     : \(String(describing: nameTextField.text!))")
        print("E-Mail   : \(String(describing: mailTextField.text!))")
        print("Password : \(String(describing: passwordTextField.text!))")
    }
}
