//
//  HomeNavigationController.swift
//  praktika
//
//  Created by Нурлыхан Таубузар on 17.05.2023.
//

import UIKit

class HomeNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 30)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
