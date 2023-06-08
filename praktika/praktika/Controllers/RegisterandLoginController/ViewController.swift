//
//  ViewController.swift
//  praktika
//
//  Created by Нурлыхан Таубузар on 11.05.2023.
//

import UIKit
import FirebaseAuth
import Firebase

class ViewController: UIViewController {
    
    var loginPage:LoginView = {
        let login = LoginView()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.backgroundColor = .black
        return login
    }()
    
    var registerPage: RegisterView = {
        let register = RegisterView()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.backgroundColor = .black
        register.isHidden = true
        return register
    }()
    
    var storeName: UILabel = {
        let name = UILabel()
        name.text = "P I N G U I N"
        name.textColor = .white
        name.font = name.font.withSize(40)
        name.textAlignment = .center
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    var control:UISegmentedControl = {
        let control = UISegmentedControl(items: ["Авторизация", "Регистрация"])
        control.selectedSegmentIndex = 0
        control.translatesAutoresizingMaskIntoConstraints = false
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.selected)
        let font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: font], for: UIControl.State.normal)
        control.addTarget(self, action: #selector(segmentAction(sender: )), for: .valueChanged)
        return control
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        itemsDisplay()
        itemsDisplayConstraints()
        view.bringSubviewToFront(loginPage)
    }
    
    @objc func segmentAction(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            view.bringSubviewToFront(loginPage)
            registerPage.isHidden = true
            loginPage.isHidden = false
            
        case 1:
            view.bringSubviewToFront(registerPage)
            registerPage.isHidden = false
            loginPage.isHidden = true
        default:
            print("smth is wrong")
        }
    }
    
    func itemsDisplay(){
        view.addSubview(storeName)
        view.addSubview(control)
        view.addSubview(loginPage)
        view.addSubview(registerPage)
    }
    
    func itemsDisplayConstraints(){
        registerPage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        registerPage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerPage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        registerPage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        registerPage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        loginPage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        loginPage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginPage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginPage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        loginPage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        control.leadingAnchor.constraint(equalTo: registerPage.leadingAnchor).isActive = true
        control.trailingAnchor.constraint(equalTo: registerPage.trailingAnchor).isActive = true
        control.heightAnchor.constraint(equalToConstant: 35).isActive = true
        control.bottomAnchor.constraint(equalTo: registerPage.topAnchor, constant: -20).isActive = true
        
        storeName.leadingAnchor.constraint(equalTo: control.leadingAnchor).isActive = true
        storeName.trailingAnchor.constraint(equalTo: control.trailingAnchor).isActive = true
        storeName.bottomAnchor.constraint(equalTo: control.topAnchor, constant: -20).isActive = true
        
        
        
        
    }
    
    
    
    
    
    
    
    
    // Проверка полей на правильность. Если все правильно функция вернет значение nil, а если есть оошибка то сообщение об ошибке
    func validateFields() -> String?{
        // Проверка что все поля заполнены
        if registerPage.firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            registerPage.lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            registerPage.email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            registerPage.password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Заполнитн все поля"
        }
        return nil
    }
    @objc func buttonAction(sender: UIButton){
        
        // Проверка полей
        let error = validateFields()
        if error != nil {
            showAlert(title: "Ошибка", message: "Заполните все поля")
        }else{
            let firstName = registerPage.firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = registerPage.lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = (registerPage.email.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
            let password = (registerPage.password.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
            // Создание пользователей
            
            Auth.auth().createUser(withEmail: email, password: password){ (result,err) in
                if err != nil{
                    self.showAlert(title: "УСПЕШНО", message: "Аккаунт был создан успешно")
                }else{
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname" :firstName!, "lastname":lastName!, "uid": result!.user.uid]){(error) in
                        if error != nil{
                            self.showAlert(title: "Ошибка", message: "Error")
                        }
                        
                    }
                    
                    self.transitionToHome()
                }
            }
            
        }
         
        
    }
    
    
    @objc func loginButtonAction(){
        let email = (loginPage.email.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        let password = (loginPage.password.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        Auth.auth().signIn(withEmail: email, password: password){ (result, error) in
            if error != nil{
                self.showAlert(title: "Ошибка", message: "Error")
            }else{
                self.transitionToHome()
            }
        }
    }
    
    
    func showAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    
    func transitionToHome(){
        let vc = InfoViewController()
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
    }
    
    
    
    
    

}

