//
//  Value.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 1/29/21.
//

import Foundation


struct Value: Hashable, Codable {
    var id: ID?
    var clean_url: String?
    var summary: String?
    var link: String?
    var media: String? //Image
    var title: String?
    
}


struct ID: Hashable, Codable{
    var _id: String?
}

