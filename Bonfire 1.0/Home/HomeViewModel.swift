//
//  HomeViewModel.swift
//  Bonfire 1.0
//
//  Created by user220270 on 10/13/22.
//

import Foundation
import WebKit
class HomeViewModel{
    
    static let shared = HomeViewModel()
    let viewController = ViewController()
    
    func getSong(){
        if (UserDefaults.standard.value(forKey: "Authorization") != nil){
           
            Task{
                
                let search = try await NetworkManager.shared.search()
            }
        } else {
            getTokenFromWebkit()
        }
         
    }
    
     func getTokenFromWebkit(){
        guard let urlRequest = NetworkManager.shared.getToken() else {
            print("error on getTokenFromWebkit")
            return
        }
        let webView = WKWebView()
        webView.load(urlRequest)
        webView.navigationDelegate = viewController.self
        viewController.view = webView
        
        
    }
    
}


