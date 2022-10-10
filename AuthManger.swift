//
//  AuthManger.swift
//  Bonfire 1.0
//
//  Created by user220270 on 10/10/22.
//

import Foundation

    struct Client {
        static let apiHost = "api.spotify.com"
        static let authHost = "accounts.spotify.com"
        static let idClient =  "01aa3eae35154a43ba95fa3c14bca894"
        static let clientSecret = "afe22aa4e0204dc3a651c5c17c3a039a"
        static let redirectUri = "https://github.com/lucianosavi"
        static let responseType = "token"
        static let scopes = "playlist-read-private"
        
        static var authParams = [
            "response_type": responseType,
            "client_id": idClient,
            "redirect_uri":redirectUri,
            "scopes":scopes
        ]
    }
    
}
