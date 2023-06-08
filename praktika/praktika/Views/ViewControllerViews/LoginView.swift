//
//  LoginView.swift
//  praktika
//
//  Created by Нурлыхан Таубузар on 11.05.2023.
//

import UIKit

class LoginView: UIView {
    
    
    var email:UITextField = {
        let email = UITextField()
        email.placeholder = "Ваш Email"
        email.translatesAutoresizingMaskIntoConstraints = false
        email.backgroundColor = .white
        return email
    }()
    
    
    
    var password:UITextField = {
        let password = UITextField()
        password.placeholder = "Ваш пароль"
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = .white
        password.isSecureTextEntry = true
        return password
    }()
    
    
    
    var loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(ViewController.loginButtonAction), for: .allTouchEvents)
        return button
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.addSubview(email)
        self.addSubview(password)
        self.addSubview(loginButton)
        displayLoginElements()
        designLoginElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func displayLoginElements(){
        email.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        email.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        email.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        email.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 20).isActive = true
        password.leftAnchor.constraint(equalTo: email.leftAnchor).isActive = true
        password.rightAnchor.constraint(equalTo: email.rightAnchor).isActive = true
        password.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        loginButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 30).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loginButton.leftAnchor.constraint(equalTo: password.centerXAnchor, constant:-50).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func designLoginElements(){
        email.layer.cornerRadius = 5
        password.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 10
    }
}
