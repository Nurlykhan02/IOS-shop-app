//
//  BuyingViewController.swift
//  praktika
//
//  Created by Нурлыхан Таубузар on 12.05.2023.
//

import UIKit

class BuyingViewController: UIViewController {
    
    var selectedProducts = ["ТОТО для Apple Iphone 13","Saiboro для Apple Iphone 13","Saiboro для Samsung Galaxy s20+","SAMSUNG SMART LED","Xiaomi Mi Power Bank 3 Ultra","Samsung EB-P3300XJ","Xiaomi Remdi Power Bank","Apple MagSafe Battery Pack"]
    
    
    var orderButton:UIButton = {
        var btn = UIButton()
        btn.backgroundColor = .black
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.setTitle("Заказать", for: .normal)
        return btn
    }()
    var productsTable:UITableView = {
        var products = UITableView()
        products.translatesAutoresizingMaskIntoConstraints = false
        products.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        products.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        return products
    }()
    var buyingTitle: UILabel = {
        let buyingTitle = UILabel()
        buyingTitle.text = "Корзина"
        buyingTitle.textAlignment = .center
        buyingTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        buyingTitle.translatesAutoresizingMaskIntoConstraints = false
        buyingTitle.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        return buyingTitle
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setElements()
        setConstraints()
        setDelegates()
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
    }
    
    func setElements(){
        view.addSubview(buyingTitle)
        view.addSubview(productsTable)
        view.addSubview(orderButton)
    }
    
    func setConstraints(){
        buyingTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        buyingTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive  = true
        buyingTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        productsTable.topAnchor.constraint(equalTo: buyingTitle.bottomAnchor, constant: 20).isActive = true
        productsTable.leadingAnchor.constraint(equalTo: buyingTitle.leadingAnchor).isActive = true
        productsTable.trailingAnchor.constraint(equalTo: buyingTitle.trailingAnchor).isActive = true
        productsTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        orderButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        orderButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        orderButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        orderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }
    
    func setDelegates(){
        productsTable.delegate = self
        productsTable.dataSource = self
    }
    
    
}

extension BuyingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productsTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = selectedProducts[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler )in
            self.selectedProducts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
        
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    
}
