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
    
    func getToken(){
        guard let signIn = URL(string:" https://accounts.spotify.com/authorize/?client_id=01aa3eae35154a43ba95fa3c14bca894&response_type=token&scope=playlist-read-private&redirect_uri=https://github.com/lucianosavi)") else {
            print("error on SignInURL")
            return
        }
    }
    func getJson<T: Codable> (movieType: String, completionHandler: @escaping (T) -> Void) {
        
        
        guard let url = URL(string: "https://api.spotify.com/v1/search?type=track&query=bad bunny") else {
            print("error on URL")
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription)
                return
            }
            print(data)
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completionHandler(result)
            } catch {
                print(error.localizedDescription)
                
            }
        }
        
        task.resume()
        
    }
    
}
