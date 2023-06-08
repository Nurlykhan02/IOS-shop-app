//
//  VViewController.swift
//  praktika
//
//  Created by Нурлыхан Таубузар on 17.05.2023.
//

import UIKit

class VViewController: UIViewController {
    static var labeltext:String?
    static var imgtext:String?
    static var productLabel:String?
    var buttonToBuy:UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("В корзину", for: .normal)
        btn.backgroundColor = .black
        btn.tintColor = .white
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(actionBtn(sender: )), for: .allTouchEvents)
        return btn
    }()
    var label:UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = labeltext
        return label
    }()
    
    var productImage:UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named:imgtext!)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var productExplain:UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = productLabel
        label.numberOfLines = 15
        
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(productImage)
        view.addSubview(productExplain)
        view.addSubview(buttonToBuy)
        
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        productImage.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30).isActive = true
        productImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        
        productExplain.topAnchor.constraint(equalTo: productImage.bottomAnchor).isActive = true
        productExplain.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        productExplain.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        productExplain.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        buttonToBuy.topAnchor.constraint(equalTo: productExplain.bottomAnchor, constant: 30).isActive = true
        buttonToBuy.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonToBuy.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonToBuy.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    

    @objc func actionBtn(sender: UIButton){
        let alert = UIAlertController(title: "Успешно", message: "Товар был добавлен", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
        
    }

}
