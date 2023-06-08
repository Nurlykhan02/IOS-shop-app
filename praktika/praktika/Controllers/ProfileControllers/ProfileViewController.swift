//
//  ProfileViewController.swift
//  praktika
//
//  Created by Нурлыхан Таубузар on 12.05.2023.
//

import UIKit
import Firebase
class ProfileViewController: UIViewController {
    
    let profileImage:UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "person.fill")
        return img
    }()
    let profileTitle:UILabel = {
        var title = UILabel()
        title.text = "Профиль"
        title.font = UIFont(name: "HelveticaNeue-Bold", size: 28)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        return title
    }()
    
    let namePerson:UILabel = {
        var name = UILabel()
        name.text = "Имя: Нурлыхан"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textAlignment = .center
        name.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        return name
    }()
    let surnamePerson:UILabel = {
        var name = UILabel()
        name.text = "Фамилия: Таубузар "
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        name.textAlignment = .center
        return name
    }()
    let emailPerson:UILabel = {
        var name = UILabel()
        name.text = "Почта: ntaubuzar@bk.ru \n \n Куплено товаров: 5"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        name.textAlignment = .center
        return name
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        addViewElements()
        setConstraints()
       
        
    }

    
    private func addViewElements(){
        view.addSubview(profileImage)
        view.addSubview(profileTitle)
        view.addSubview(namePerson)
        view.addSubview(surnamePerson)
        view.addSubview(emailPerson)
    }
    
    private func setConstraints(){
        profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        profileTitle.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20).isActive = true
        profileTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        profileTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        namePerson.topAnchor.constraint(equalTo: profileTitle.bottomAnchor, constant: 25).isActive = true
        namePerson.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        namePerson.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        surnamePerson.topAnchor.constraint(equalTo: namePerson.bottomAnchor, constant: 25).isActive = true
        surnamePerson.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        surnamePerson.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        emailPerson.topAnchor.constraint(equalTo: surnamePerson.bottomAnchor, constant: 25).isActive = true
        emailPerson.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        emailPerson.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        emailPerson.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    
}
