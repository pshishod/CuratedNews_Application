//
//  News.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 1/27/21.
//

import Foundation

struct News: Hashable, Codable {
    var title: String
    var url : String
    var description: String
    var provider : Provider
    var image : imaage
}


//

