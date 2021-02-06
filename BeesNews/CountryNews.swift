//
//  CountryNews.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 1/27/21.
//

import SwiftUI


class update: ObservableObject{
    @Published var obj_loaded: Bool = false
    init(){
    }
    
}


struct CountryNews: View {
    
    @ObservedObject var up = update()
    var body: some View {
        
        
        
        
        
 
        if up.obj_loaded == false{
            Text("loading...")
            
            var get_news_object: () = getreq(headers: headers, request: request){ result in
                let str: NewNews = result as! NewNews
            //            print("\n\n\n\n\n\n\n\n\\n\n")
            //            print("bye")

            //            print(str.articles[0].title)
                news_object = str
                print("this is after the completion handler, this should only print once")
                up.obj_loaded = true
        //            Text((news_object?.articles[0].title)!)
                
        //                print(news_object)
                
            //            print("hi")
            //            print("\n\n\n\n\n\n\n\n\\n\n")
            }
            
            
        }else{
        
        NavigationView {
            

            
            
//            List((news_object?.articles ?? [obj])){new in
//                NewsRow(new: new).padding(5)
//            }
            List(news_object?.articles ?? [obj], id: \.link){ new in
                NewsRow(new: new)
            }
            
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "doc.append").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Text("News")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                        
                        
                        
                    }
                    
                    
                    
                    
                }
            }
            
            
            
            
        }
        }
        
        
    }
    
}


struct CountryNews_Previews: PreviewProvider {
    static var previews: some View {
        CountryNews()
    }
}
