//
//  APIcall.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 1/28/21.
//

import Foundation

//Make news_object a global variable available to all files. Change news_object into the decodable object result of the API call
var news_object: NewNews?
func assign_obj() -> String{
    news_object?.articles[0].title = "This is the default title for news_object global variable"
    news_object?.articles[0].link = "This is the default link for news_object global variable"
    news_object?.articles[0].summary = "This is the default summary for news_object global variable"
    news_object?.articles[0].clean_url = "This is the default clean_url for news_object global variable"
    return "This is the news_object default initializer"
}

var obj: Value = Value()
func assign() -> String{
    obj.summary = "muskmelon"
    obj.link = "muskmelon"
    obj.media = "https://lh3.googleusercontent.com/a-/AOh14GjgZnjQ78VFW--CfL6Sy_MBpEIg7KnFyEZ0tbx4sQ=s96-c"
    obj.title = "muskmelon"
    var id: ID = ID()
    id._id = "12345654321qwerty"
    obj._id = "1234567890qwertyu"
    
    return "This is the function call"
}
//    = [summary: "muskmelon", "link": "muskmelon", "media": "https://lh3.googleusercontent.com/a-/AOh14GjgZnjQ78VFW--CfL6Sy_MBpEIg7KnFyEZ0tbx4sQ=s96-c", "title": "muskmelon", "id": "12345654321qwerty"]
//var obj2: Value = ["summary": "melonmusk", "link": "melonmusk", "media": "https://lh3.googleusercontent.com/a-/AOh14GjgZnjQ78VFW--CfL6Sy_MBpEIg7KnFyEZ0tbx4sQ=s96-c", "title": "melonmusk", "id": "poiuytyuiop098765"]
//var fin_obj: NewNews = ["articles": [obj, obj2]]







//Make the API call
//let headers = [
//    "x-rapidapi-key": "058005833dmshec499de137c4414p17cb4fjsn68022fc7cf27",
//    "x-rapidapi-host": "newscatcher.p.rapidapi.com"
//]
//
//let request = NSMutableURLRequest(url: NSURL(string: "https://newscatcher.p.rapidapi.com/v1/search_free?q=Elon%20Musk&lang=en&media=True")! as URL,
//                                  cachePolicy: .useProtocolCachePolicy,
//                                  timeoutInterval: 10.0)



let headers = [
    /*"x-rapidapi-key": "b2313f35f5msh553394ee9d8aa42p1e1b77jsn89191a2445d7",*/
    "x-rapidapi-key": "058005833dmshec499de137c4414p17cb4fjsn68022fc7cf27",
    "x-rapidapi-host": "newscatcher.p.rapidapi.com"
]

let request = NSMutableURLRequest(url: NSURL(string: "https://newscatcher.p.rapidapi.com/v1/search_free?q=India&lang=en&page_size=100&media=True")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 10.0)







func getreq(headers: Dictionary<String, String>, request: NSMutableURLRequest, finished: @escaping (Decodable)->Void){
    print("Inside getreq")
    UserDefaults.standard.set([], forKey: user_key)
    assign_obj()
    
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error as Any)
        } else {
            let decoder = JSONDecoder()
            if let newnews = try? decoder.decode(NewNews.self, from: data!) {
                DispatchQueue.main.async {
                    finished(newnews)
                }
                
            } else  {
                
                print("There was an error \(String(describing: error))")
            }
            
            
            
            
            
        }
    })
    
    dataTask.resume()
    
}



//Print the title of the object (test function)
func printTitle() -> String{
    if let title = news_object?.articles[0].title{
        
        print("\n\n\n\n\n\n\n\n\n\n")
        print("hehehe")
        print(title)
        print("bebebebbe")
        
        print("\n\n\n\n\n\n\n\n\n\n")
        return title
    }
    else{
        print(news_object)
        return ""
    }
    
}
