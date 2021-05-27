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
/*----- update is used for updating the view once the API call has been made-----*/
class update: ObservableObject{
    @Published var obj_loaded: Bool = false
    init(){
    }
    
}
/*----- refresh is used for updating the view once a delete request for a row has been made -----*/
class refresh: ObservableObject{
    @Published var refreshing:Bool = false
    init(){
    }
}



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
                print("this is after the completion handler, this should only print once")  //Sanity check to make sure only one API call is going through
                up.obj_loaded = true    //Update the boolean to update the view

            }
            
            
        }else{
        /*----- If the API call has been successfully made, then do the following -----*/
        NavigationView {
            List{
                
                ForEach(news_object?.articles ?? [
                obj], id: \._id){ new in    //Iterate through each aticle from the API call
                /*Navigation link allows each individual tab in countrynews to be linked to another view. Whenever a tab is clicked, it redirectsw to a new view defined in destination.*/
                
                NavigationLink(destination : extendedNews(news_object: new)){
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

        news_object?.articles.remove(atOffsets: offsets) //This removes the row from the global variable news_object
        
        
        ref.refreshing = true   //Update the view to allow the new list to be visible.
        
        
    }
    
    
    
}


struct CountryNews_Previews: PreviewProvider {
    static var previews: some View {
        CountryNews()
    }
}
