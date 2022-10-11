//
//  NetworkManage.swift
//  Bonfire 1.0
//
//  Created by user220270 on 10/10/22.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let apiKey = "01aa3eae35154a43ba95fa3c14bca894"
    private let scopes = "playlist-read-private"
    
    func getToken() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = Client.authHost
        components.path = "/authorize"
        
        components.queryItems = Client.authParams.map({URLQueryItem(name: $0, value: $1)})
        guard let url = components.url else{
            print("error get token")
            return nil
            
        }
        return URLRequest(url: url)
    }
    
    func createUrlRequest() -> URLRequest? {
        var component = URLComponents()
        component.scheme = "https"
        component.host = Client.apiHost
        component.path = "/v1/search"
        
        component.queryItems = [
        URLQueryItem(name: "type", value: "track"),
        URLQueryItem(name: "query", value: "Hollywood Devil")
        ]
        guard let url = component.url else {
            print("error on guard let creatUrlRequest")
            return nil
             }
        var urlRequest = URLRequest(url: url)
        
        let token:String = UserDefaults.standard.value(forKey: "Authorization") as! String
        urlRequest.addValue("Bearer" + token, forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlRequest.httpMethod = "GET"
        return urlRequest
        }
    func search() async throws -> [String]{
        guard let urlRequest = createUrlRequest() else {throw  NetworkError.invalidUrl}
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(Result.self, from: data)
        
        let items = result.tracks?.items
        
        print("Resultado",items)
        
        return[]
    }
    
    }

