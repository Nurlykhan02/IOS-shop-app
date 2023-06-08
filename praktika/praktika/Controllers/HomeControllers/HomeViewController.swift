//
//  HomeViewController.swift
//  praktika
//
//  Created by Нурлыхан Таубузар on 12.05.2023.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
        title = "P I N G U I N E"
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    }
    
    
    private func generateTabBar(){
        viewControllers = [generateTabBarViews(viewcontroller: CatalogViewController(), title: "Каталог", image:UIImage(systemName: "person.fill")),
        generateTabBarViews(viewcontroller: BuyingViewController(), title: "Корзина", image: UIImage(systemName: "person.fill")),
                           generateTabBarViews(viewcontroller: ProfileViewController(), title: "Профиль", image:UIImage(systemName: "person.fill"))]
    }
    
    private func generateTabBarViews(viewcontroller:UIViewController, title:String, image:UIImage?) -> UIViewController{
        viewcontroller.tabBarItem.title = title
        viewcontroller.tabBarItem.image = image
        return viewcontroller
    }
    
    
    private func setTabBarAppearance(){
        let roundLayer = CAShapeLayer()
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY *  2
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX, y: tabBar.bounds.minY - positionOnY, width: width, height: height), cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
