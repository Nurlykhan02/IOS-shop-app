//
//  RegisterView.swift
//  praktika
//
//  Created by Нурлыхан Таубузар on 11.05.2023.
//

import UIKit

class RegisterView: UIView {
    
    var firstName:UITextField = {
        let name = UITextField()
        name.placeholder = "Ваше имя"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.backgroundColor = .white
        return name
    }()
    
    
    
    var lastName:UITextField = {
        let lastname = UITextField()
        lastname.placeholder = "Ваша Фамилия"
        lastname.translatesAutoresizingMaskIntoConstraints = false
        lastname.backgroundColor = .white
        return lastname
    }()
    var email:UITextField = {
        let email = UITextField()
        email.placeholder = "Ваша почта"
        email.translatesAutoresizingMaskIntoConstraints = false
        email.backgroundColor = .white
        return email
    }()
    
    var password:UITextField = {
        let pass = UITextField()
        pass.placeholder = "Ваш пароль"
        pass.translatesAutoresizingMaskIntoConstraints = false
        pass.backgroundColor = .white
        pass.isSecureTextEntry = true
        return pass
    }()
    
    
    var registerButton:UIButton = {
        let button = UIButton()
        button.setTitle("Регистрация", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(ViewController.buttonAction(sender:)), for: .allTouchEvents)
        return button
    }()
    
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        displayRegisterElements()
        designRegisterElements()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func displayRegisterElements(){
        self.addSubview(firstName)
        self.addSubview(registerButton)
        self.addSubview(lastName)
        self.addSubview(email)
        self.addSubview(password)
        
        firstName.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        firstName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        firstName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        firstName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        lastName.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 20).isActive = true
        lastName.leadingAnchor.constraint(equalTo: firstName.leadingAnchor).isActive = true
        lastName.trailingAnchor.constraint(equalTo: firstName.trailingAnchor).isActive = true
        lastName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        email.topAnchor.constraint(equalTo: lastName.bottomAnchor, constant: 20).isActive = true
        email.leadingAnchor.constraint(equalTo: lastName.leadingAnchor).isActive = true
        email.trailingAnchor.constraint(equalTo: lastName.trailingAnchor).isActive = true
        email.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 20).isActive = true
        password.leadingAnchor.constraint(equalTo: email.leadingAnchor).isActive = true
        password.trailingAnchor.constraint(equalTo: email.trailingAnchor).isActive = true
        password.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        registerButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 30).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: password.centerXAnchor, constant:-75).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        
    }
    
    func designRegisterElements(){
        firstName.layer.cornerRadius = 5
        lastName.layer.cornerRadius = 5
        email.layer.cornerRadius = 5
        password.layer.cornerRadius = 5
        registerButton.layer.cornerRadius = 10
    }
}
