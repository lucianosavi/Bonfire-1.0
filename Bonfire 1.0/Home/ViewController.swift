//
//  ViewController.swift
//  Bonfire 1.0
//
//  Created by user220270 on 10/3/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Olá Luciano, seja bem vindo."
        label.textColor = .systemCyan
        
        return label
    }()
    
     lazy var bonfireImage:UIImageView = {
        let image = UIImageView()
         image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bonfireHome")
        image.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
         image.contentMode = .scaleToFill
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 14/255, green: 14/255, blue: 16/255, alpha: 1)
        view.addSubview(bonfireImage)
        view.addSubview(topLabel)
        setupConstrants()
        
    }
    
    func setupConstrants () {
        NSLayoutConstraint.activate([
            
            topLabel.topAnchor.constraint(equalTo: view.topAnchor),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -100),
            topLabel.bottomAnchor.constraint(equalTo: bonfireImage.topAnchor,constant: -50),
            
            bonfireImage.topAnchor.constraint(equalTo: view.topAnchor,constant: 250),
            bonfireImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bonfireImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             bonfireImage.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -250),
            
        ])
        
    }
    
}
