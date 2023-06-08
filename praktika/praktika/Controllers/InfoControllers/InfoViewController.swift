//
//  InfoViewController.swift
//  praktika
//
//  Created by Нурлыхан Таубузар on 12.05.2023.
//


import UIKit

class InfoViewController: UIViewController {
    private let scrollview:UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.bounces = false
        return scroll
    }()
    
    private let pageControl:UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 2
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        return pageControl
    }()
    
    private var slides = [InfoPage]()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
        setDelegates()
        slides = createSlides()
        setupslidesScrollView(slides: slides)
    }
    
    func setupViews(){
        view.addSubview(scrollview)
        view.addSubview(pageControl)
    }
    func setConstraints(){
        scrollview.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    func setDelegates(){
        scrollview.delegate = self
        
    }
    
    func createSlides() -> [InfoPage]{
        let firstpage = InfoPage()
        firstpage.pageLabel.font = .boldSystemFont(ofSize: 40)
        firstpage.pageLabel.numberOfLines = 2
        firstpage.btnStart.isHidden = true
        firstpage.setPageText(text: "P I N G U I N E")
        
        
    
        let secondpage = InfoPage()
        
        secondpage.setPageText(text: "Добро пожаловать в проект \n Мобильное приложение для продажи мобильных аксессуаров")
        secondpage.btnStart.addTarget(self, action: #selector(startBtnAction(sender:)), for: .allTouchEvents)

        
        
        return [firstpage,secondpage]
    }
    
    private func setupslidesScrollView(slides:[InfoPage]){
        scrollview.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollview.isPagingEnabled = true
        
        for i in 0..<slides.count{
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollview.addSubview(slides[i])
        }
        
    }
    
    @objc func startBtnAction(sender: UIButton){
        let vc = HomeNavigationController(rootViewController: HomeViewController())
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
    }
    
}

extension InfoViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
