//
//  CountryNews.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 1/27/21.
//

import SwiftUI

struct CountryNews: View {
    var body: some View {
        NavigationView {
            
        
                List(news){new in
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
    

struct CountryNews_Previews: PreviewProvider {
    static var previews: some View {
        CountryNews()
    }
}
