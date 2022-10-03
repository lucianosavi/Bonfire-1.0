//
//  LoginView.swift
//  Bonfire 1.0
//
//  Created by user220270 on 10/3/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    lazy var loginImage:UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
       image.image = UIImage(named: "login")
       //image.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        image.contentMode = .scaleToFill
       return image
   }()
    
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .systemCyan
        textField.layer.borderWidth = 1
        textField.attributedPlaceholder = NSAttributedString(
            string: "Insira seu usuario",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
            )
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Insira sua senha"
        textField.textColor = .systemCyan
        textField.layer.borderWidth = 1
        textField.attributedPlaceholder = NSAttributedString(
            string: "Insira seu senha",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
            )
        return textField
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirmar", for: .normal)
        button.tintColor = .systemCyan
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmButton)
        view.addSubview(loginImage)
        setupConstrants()
        
    }
    
    func setupConstrants () {
        NSLayoutConstraint.activate([
            
            loginImage.topAnchor.constraint(equalTo: view.topAnchor,constant: 15),
            loginImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            loginImage.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40),
            
            usernameTextField.topAnchor.constraint(equalTo: loginImage.bottomAnchor,constant: 60),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 80),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -80),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor,constant: 25),
            passwordTextField.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            
            
            confirmButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            confirmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15),
            confirmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100)
            
            
        ])
        
    }
    
}
