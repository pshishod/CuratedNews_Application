//
//  ContentView.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 1/24/21.
//
//Displays the front page of the application. Displays the bottom tab to navigate between pages.

import SwiftUI

struct ContentView: View {
    @State private var selection = 0

    var body: some View {
        TabView(selection: $selection){
            
            CountryNews().tabItem { Image(systemName: "doc.append") }.tag(1)
            BlacklistedPubs().tabItem {
                Image(systemName: "bin.xmark.fill") }.tag(2)
        }

}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
