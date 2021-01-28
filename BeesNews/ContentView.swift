//
//  ContentView.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 1/24/21.
//

import SwiftUI

struct ContentView: View {
    init() {
            //Use this if NavigationBarTitle is with Large Font
           

            //Use this if NavigationBarTitle is with displayMode = .inline
        }
    var body: some View {
        TabView{
            CountryNews().tabItem { Image(systemName: "flag.circle.fill") }.tag(0)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
