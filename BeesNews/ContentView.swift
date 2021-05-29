//
//  ContentView.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 1/24/21.
//
//Displays the front page of the application. Displays the bottom tab to navigate between pages.

import SwiftUI

struct ContentView: View {
    
    //Variable used for selecting which view to display from the Tabview
    @State private var selection = 0
    
    var body: some View {
        //Displays the tab view on the bottom of the screen. Allows chaning views by selecting different tabs
        TabView(selection: $selection){
            
            //This tab is the news for a country
            CountryNews().tabItem {
                Image(systemName: "doc.append")
            }.tag(1)
            
            //This tab is the list of the blacklisted publishers that the user deleted
            BlacklistedPubs().tabItem {
                Image(systemName: "bin.xmark.fill")
            }.tag(2)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
