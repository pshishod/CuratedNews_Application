//
//  BlacklistedPubs.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 5/28/21.
//

import SwiftUI

struct BlacklistedPubs: View {
    @ObservedObject var ref = refresh()
    var body: some View {
        //Uncomment before running
        let blacklisted_item = UserDefaults.standard.object(forKey: user_key) as! [String]
        /*let debug = ["One", "two", "three", "four"]*/ //Using for debuggin and preview purposes
        
        NavigationView{
            List{
                
                //Uncomment before running
                
                //Display the blacklisted publishers
                ForEach(blacklisted_item, id: \.self){ index in
                    Text(index)
                }.onDelete(perform : restoreRow)
                
                
                //Comment before running
                /*ForEach(debug, id: \.self){ index in
                 Text(index)
                 }.onDelete(perform : restoreRow)*/
                
            }.listStyle(InsetGroupedListStyle()).navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "bin.xmark.fill").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Text("Blacklisted")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                }
            }//Make pretty
        }.onAppear(perform : refresher) //Very important. Refresh the view when it loads to show the updated value from CountryNews
    }
    
    /*----- Function to whitelist the publishers -----*/
    func restoreRow(at offsets : IndexSet){
        var blacklisted_item = UserDefaults.standard.object(forKey: user_key) as! [String] //Store blacklist items in a variables
        
        blacklisted_item.remove(atOffsets: offsets) //Remove the items from the offsets gotten from the for each loop
        
        UserDefaults.standard.set(blacklisted_item, forKey: user_key)   //Set the new array back to userdefaults
        
        ref.refreshing = true   //Refresh the view
    }
    
    /*----- Refresh the View -----*/
    func refresher(){
        ref.refreshing = true
    }
}


struct BlacklistedPubs_Previews: PreviewProvider {
    static var previews: some View {
        BlacklistedPubs()
    }
}
