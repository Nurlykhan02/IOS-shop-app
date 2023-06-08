//
//  CatalogModel.swift
//  praktika
//
//  Created by Нурлыхан Таубузар on 17.05.2023.
//

import Foundation
struct Section {
    let title: String
    let options: [String]
    var isOpened = true
    
    init(title: String, options: [String], isOpened: Bool = true) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
}
