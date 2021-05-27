//
//  CountryNews.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 1/27/21.
//
//Gets the API call and displays it in a tabular format

import SwiftUI


//Dummy destination page for testing purposes
struct DestinationPageView: View {
    var color: Color
    var body: some View {
        Text("Destination Page")
            .font(.title)
            .foregroundColor(color)
    }
}

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
                news_object = str
                print("this is after the completion handler, this should only print once")
                up.obj_loaded = true

            }
            
            
        }else{
        
        NavigationView {
            
            List(news_object?.articles ?? [obj], id: \.link){ new in
                /*Navigation link allows each individual tab in countrynews to be linked to another view. Whenever a tab is clicked, it redirectsw to a new view defined in destination.*/
                
                NavigationLink(destination : DestinationPageView(color: .pink)){
                NewsRow(new: new)
                }
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
