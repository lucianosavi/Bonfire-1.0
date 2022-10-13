//
//  NetworkManage.swift
//  Bonfire 1.0
//
//  Created by user220270 on 10/10/22.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    var songNameTest = "Snuff"

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
        URLQueryItem(name: "query", value: songNameTest)
        ]
        guard let url = component.url else {
            print("error on guard let creatUrlRequest")
            return nil
             }
        var urlRequest = URLRequest(url: url)
        
        let token:String = UserDefaults.standard.value(forKey: "Authorization") as! String
        urlRequest.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print(UserDefaults.standard.value(forKey: "Authorization"))
        urlRequest.httpMethod = "GET"
       
        return urlRequest
        }
    func search() async throws -> [String]{
        guard let urlRequest = createUrlRequest() else {

            throw  NetworkError.invalidUrl

        }

        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        
        
        
        
        let resultString = String(decoding: data, as: UTF8.self)
        print(resultString)
        let decoder = JSONDecoder()
        //let result = try decoder.decode(Result.self, from: data)
        
        do {
            let result = try decoder.decode(Result.self, from: data)
            print(result)
        } catch {
            print(error.localizedDescription)
            
        }
       
       
       // let items = result.tracks?.items
     
        return[]
    }
   
    
    
    }

   /*erro na resultString vem "error" : {
"status" : 400,
"message" : "No search query"
}
    */

