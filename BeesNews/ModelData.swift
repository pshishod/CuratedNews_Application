//
//  ModelData.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 1/27/21.
//

import Foundation

var news : [News] = load("Js1.JSON")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}




//Load from an API call:
//var news = [News]()
//let fileurl = URL(string: "https://contextualwebsearch-websearch-v1.p.rapidapi.com/api/search/NewsSearchAPI?q=india&pageNumber=1&pageSize=50&autoCorrect=true&safeSearch=false&withThumbnails=true&fromPublishedDate=null&toPublishedDate=null")
//
//
//func loadData(url: URL){
//    var req = URLRequest(url: url)
//    req.setValue("058005833dmshec499de137c4414p17cb4fjsn68022fc7cf27", forHTTPHeaderField:"x-rapidapi-key")
//    req.addValue("contextualwebsearch-websearch-v1.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
//
//    URLSession.shared.dataTask(with: req){
//        data, response, error in
//        if let decodedresponse = try? JSONDecoder().decode([News].self, from: data!){
//            DispatchQueue.main.async {
//                news = decodedresponse
//                print(news)
//            }
//            return
//        }
//        print("error here")
//    }.resume()
//
//}

