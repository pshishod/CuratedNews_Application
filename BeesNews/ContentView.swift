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
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]

            //Use this if NavigationBarTitle is with displayMode = .inline
        }
    var body: some View {
        
        NavigationView {
            ScrollView{
                NewsRow(new: news)
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Image(systemName: "doc.append")
                            Text("News")
                                .font(.headline)
                                .foregroundColor(.blue)
                        }
                        
                    }
                    
                } 
        }
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
