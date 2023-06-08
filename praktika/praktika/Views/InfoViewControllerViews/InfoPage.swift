//
//  FirstPage.swift
//  praktika
//
//  Created by Нурлыхан Таубузар on 12.05.2023.
//

import UIKit

class InfoPage: UIView {
    let btnStart:UIButton = {
        let btn = UIButton()
        btn.setTitle("Старт", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    let pageLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pageLabel)
        addSubview(btnStart)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            pageLabel.widthAnchor.constraint(equalToConstant: 300),
            pageLabel.heightAnchor.constraint(equalToConstant: 150),
            pageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            
            btnStart.topAnchor.constraint(equalTo: pageLabel.bottomAnchor),
            btnStart.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            btnStart.widthAnchor.constraint(equalToConstant: 100),
            btnStart.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    public func setPageText(text:String){
        pageLabel.text =  text
    }
}
