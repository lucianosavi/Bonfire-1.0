//
//  ViewController.swift
//  Bonfire 1.0
//
//  Created by user220270 on 10/3/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    
   private let networkManager = NetworkManager()
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Olá Luciano, seja bem vindo."
        label.textColor = .systemCyan
         return label
    }()
    
    lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " "
        label.textColor = .systemCyan
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        
        
        return label
    }()
    
    lazy var thirdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Musica atual Leandro e leonardo - Sonho por Sonho (01:30)"
        label.textColor = .systemCyan
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.layer.borderColor = UIColor(red: 110/255, green: 110/255, blue: 110/255, alpha: 1).cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 5
        return label
    }()
    
    
    lazy var topStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [topLabel,emptyLabel,thirdLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 25/255, alpha: 1)
        stackView.layer.cornerRadius = 5
        return stackView
    }()
    
    lazy var bottomStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 25/255, alpha: 1)
        stackView.layer.cornerRadius = 5
        return stackView
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
        view.backgroundColor =  UIColor(red: 110/255, green: 110/255, blue: 110/255, alpha: 1)
        view.addSubview(bonfireImage)
        view.addSubview(topStackView)
        view.addSubview(bottomStackView)
        if (UserDefaults.standard.value(forKey: "Authorization") != nil){
            
        } else {
            getTokenFromWebkit()
        }
     //   setupConstrants()
        
         
    }
    
    private func getTokenFromWebkit(){
        guard let urlRequest = NetworkManager.shared.getToken() else {
            print("error on getTokenFromWebkit")
            return
        }
        let webView = WKWebView()
        webView.load(urlRequest)
        webView.navigationDelegate = self
        view = webView
        
       
    }
    
//    func setupConstrants () {
//        NSLayoutConstraint.activate([
//
//            topStackView.topAnchor.constraint(equalTo: view.topAnchor,constant: 65),
//            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            topStackView.bottomAnchor.constraint(equalTo: bonfireImage.topAnchor),
//
//            bonfireImage.topAnchor.constraint(equalTo: view.topAnchor,constant: 180),
//            bonfireImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            bonfireImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            bonfireImage.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -250),
//
//            bottomStackView.topAnchor.constraint(equalTo: bonfireImage.bottomAnchor),
//            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -25)
//
//        ])
//
//
//    }
    
}
extension ViewController:WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let urlString = webView.url?.absoluteString else{
            print("error on navigationDelegate extension")
            return
        }
        var tokenString = ""
        print("teste",urlString)
        if urlString.contains("access_token=") == true {
            let range = urlString.range(of: "#access_token=")
            guard let index = range?.upperBound else {
                print("error on guard let index = range")
                return
            }
            tokenString = String(urlString[index...])
          
        }
        if !tokenString.isEmpty{
            let range = tokenString.range(of: "&token_type=Bearer")
            guard let index = range?.lowerBound else {
                print("error on guard let index = range")
                return
            }
            tokenString = String(tokenString[..<index])
            UserDefaults.standard.setValue(tokenString, forKey: "Authorization")
            
        }
    }
   
}
