//
//  CountryNews.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 1/27/21.
//
//Gets the API call and displays it in a tabular format. Shows all the news and allows blacklisting of publishers

import SwiftUI


//Dummy destination page for testing purposes. Uncomment when using

/*struct DestinationPageView: View {
 var color: Color
 var body: some View {
 Text("Destination Page")
 .font(.title)
 .foregroundColor(color)
 }
 }*/


struct CountryNews: View {
    /*----- Initialize the view update variables -----*/
    @ObservedObject var up = update()
    @ObservedObject var ref = refresh()
    
    var body: some View {
        /*----- If the API call has not been successfully made, then do the following -----*/
        if up.obj_loaded == false{
            Text("loading...")
            
            var _: () = getreq(headers: headers,     request: request){ result in
                let str: NewNews = result as! NewNews   //Make the API call and store it in str
                news_object = str   //Store the NewNews object from the API call in the global variable news_object
                print("this is after the completion handler, this should only print once") //Sanity check to make sure only one API call is going through
                
                /*----- Below is the code to delete the news that is already blacklisted -----*/
                
                let blacklisted = UserDefaults.standard.object(forKey: user_key) as! [String] //Store the blacklisted publishers in a variable
                
                let blacklist_len = blacklisted.count //Store the length of above
                
                let arr_len = news_object?.articles.count   //Store the length of the actual news articles
                
                var indices : IndexSet = [] //Make a variable to store the indices of news articles that should be deleted
                
                //Loop through the above arrays and store the matches in indices
                for i in 0..<blacklist_len {
                    for j in 0..<arr_len! {
                        if(blacklisted[i] == news_object?.articles[j].clean_url){
                            indices.insert(j)
                        }
                    }
                }
                
                news_object?.articles.remove(atOffsets: indices) //Delete all the matches
                
                /*----- Code ends above this -----*/
                
                up.obj_loaded = true    //Update the boolean to update the view
                
            }
            
            
        }else{
            /*----- If the API call has been successfully made, then do the following -----*/
            NavigationView {
                List{
                    
                    ForEach(news_object?.articles ?? [
                                obj], id: \._id){ new in    //Iterate through each aticle from the API call
                        /*Navigation link allows each individual tab in countrynews to be linked to another view. Whenever a tab is clicked, it redirectsw to a new view defined in destination.*/
                        
                        NavigationLink(destination : extendedNews(local_news_object: new)){
                            
                            /*uncomment before running*/
                            
                            NewsRow(new: new)
                            
                            
                            
                        }
                        
                    }.onDelete(perform: removeRows)//If the user deletes the selected, row, then call removeRows
                    
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
                }//Make it pretty
                
            }
        }
        
    }
    
    /*----- Function to remove the selected row -----*/
    func removeRows(at offsets: IndexSet) {
        
        /*----- Initialize and declare the variables ------*/
        var tb_deleted : String?
        var arr_len : Int?
        var indices : IndexSet = []
        
        /*----- If the selected publisher to be removed is the first selected publisher, then add it to the storage to remember -----*/
        if UserDefaults.standard.object(forKey: user_key) == nil{
            
            offsets.forEach{index in
                
                UserDefaults.standard.set([news_object?.articles[index].clean_url], forKey: user_key)
                tb_deleted = news_object?.articles[index].clean_url
            }
        }else{
            /*----- Otherwise, add it to the array containing the blacklisted publishers -----*/
            var blacklisted = UserDefaults.standard.object(forKey: user_key) as! [String]
            
            offsets.forEach{index in
                
                if(!(blacklisted.contains((news_object?.articles[index].clean_url)!))){
                    
                    blacklisted.append(news_object?.articles[index].clean_url ?? "default_value")
                    tb_deleted = news_object?.articles[index].clean_url
                    
                }else{
                    print("\n\n\n THIS SHOULD NEVER PRINT\n\n\n")
                }
                
            }
            /*----- Note all the indices where the publisher published the news in news_object -----*/
            UserDefaults.standard.set(blacklisted, forKey: user_key)
            arr_len = news_object?.articles.count
            
            for index in 0..<arr_len! {
                if(tb_deleted == news_object?.articles[index].clean_url){
                    indices.insert(index)
                    
                }
                
            }
            
            /*----- Remove all the articles from that publisher -----*/
            news_object?.articles.remove(atOffsets: indices)//This removes the rows from the global variable news_object

            /*----- Very important step -----*/
            ref.refreshing = true    //Update the view to allow the new list to be visible.
            
            
            
        }
    }
}






struct CountryNews_Previews: PreviewProvider {
    static var previews: some View {
        CountryNews()
    }
}
