//
//  HomeModel.swift
//  Bonfire 1.0
//
//  Created by user220270 on 10/4/22.
//

import Foundation

struct Result:Codable {
    var tracks:Tracks?
    
   
}
struct Tracks:Codable{
    var items:[Items]?
    
}
struct Items:Codable{
    
    
    var name:String?
    var id:String?
    var external_urls:ExternalUrls?
}
struct ExternalUrls:Codable{
    var spotify:String?
    
}
