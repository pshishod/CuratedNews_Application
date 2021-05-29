//
//  BlacklistedPubs.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 5/28/21.
//

import SwiftUI
var countryNews_message = false
struct BlacklistedPubs: View {
    @ObservedObject var ref = refresh()
    var body: some View {
        //Uncomment before running
        let blacklisted_item = UserDefaults.standard.object(forKey: user_key) as! [String]
        /*let debug = ["One", "two", "three", "four"]*/ //Using for debuggin and preview purposes
        NavigationView{
        List{
            //Uncomment before running
            
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
        }
        }.onAppear(perform : refresher)
    }
    func restoreRow(at offsets : IndexSet){
        var blacklisted_item = UserDefaults.standard.object(forKey: user_key) as! [String]
        blacklisted_item.remove(atOffsets: offsets)
        UserDefaults.standard.set(blacklisted_item, forKey: user_key)
        ref.refreshing = true
        }
    func refresher(){
        ref.refreshing = true
    }
    }


struct BlacklistedPubs_Previews: PreviewProvider {
    static var previews: some View {
        BlacklistedPubs()
    }
}
