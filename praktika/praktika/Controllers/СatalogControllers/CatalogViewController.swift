//
//  CatalogViewController.swift
//  praktika
//
//  Created by Нурлыхан Таубузар on 12.05.2023.
//

import UIKit

class CatalogViewController: UIViewController {
    
    let tableview:UITableView = {
        var table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        return table
    }()
    
    private var sections = [Section]()
    private var explains = [explain]()
    override func viewDidLoad() {
        title = "Каталог"
        super.viewDidLoad()
        // Модель
        
        sections = [Section(title: "Чехлы", options: ["ТОТО для Apple Iphone 13","Saiboro для Apple Iphone 13","Saiboro для Samsung Galaxy s20+","SAMSUNG SMART LED"]),
                    Section(title: "Зарядные устройства", options: ["Ugreen CD130 Серый","Quezqa Z60E белый","Apple 20W USB-C POWER Adapter","Apple 18W USB-C POWER Adapter"]),
                    Section(title: "Держатели", options: ["Ugreen LP177 60343","OEM Rogatka","Borofone BH53","MULU YSD-29"]),
                    Section(title: "Аккумуляторы", options: ["Xiaomi Mi Power Bank 3 Ultra","Samsung EB-P3300XJ","Xiaomi Remdi Power Bank","Apple MagSafe Battery Pack"]),
                    Section(title: "Украшения", options: ["Studex наклейки","Sanremo наклейки","Royal Touch","Huawei Nova новый окрас"])
                
        ]
        
        explains = [explain(title: "ТОТО для Apple Iphone 13", descripton: "Цена: 3000тг /n Оплата. Оплата при получении товара /n В настоящий момент использование бонусов на данный товар недоступно /n Гарантия. 14 дней Обмен/возврат товара в течение 14 дней ")]
        view.addSubview(tableview)
        setConstraints()
        setDelegates()
    }
    
    private func setDelegates(){
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func setConstraints(){
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableview.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
}



extension CatalogViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        if section .isOpened{
            return section.options.count + 1
            
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row == 0 {
            cell.textLabel?.text = sections[indexPath.section].title
            cell.textLabel?.textAlignment = .center
            cell.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
            cell.textLabel?.textColor = .white
            cell.layer.cornerRadius = 10
            cell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
            return cell
        }else{
            cell.textLabel?.text = sections[indexPath.section].options[indexPath.row - 1]
            cell.textLabel?.textAlignment = .left
            cell.textLabel?.textColor = #colorLiteral(red: 0.1019607843, green: 0.1019607843, blue: 0.1019607843, alpha: 1)
            cell.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
            cell.textLabel?.font = UIFont(name: "HelveticNeue-Light", size: 17)
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0{
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableview.reloadSections([indexPath.section], with: .none)
        }
        else{
            VViewController.labeltext = sections[indexPath.section].options[indexPath.row - 1]
            VViewController.imgtext = sections[indexPath.section].options[indexPath.row - 1]
            VViewController.productLabel = " Цена: 3000тг \n \nОплата. Оплата при получении товара \n\n В настоящий момент использование бонусов на данный товар недоступно \n \nГарантия. 14 дней Обмен/возврат товара в течение 14 дней"
            navigationController?.pushViewController(VViewController(), animated: true)
        }
    }
}
   
