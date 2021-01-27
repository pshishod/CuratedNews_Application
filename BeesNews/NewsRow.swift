//
//  NewsRow.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 1/27/21.
//

import SwiftUI

struct NewsRow: View {
    var new: [News]
    var body: some View {
        ZStack(alignment: .leading){
        Color.flatDarkCardBackground
        HStack{
            RemoteImage(url: new[2].image.url)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
            VStack(spacing: 15){
                DisclosureGroup(
                    new[2].title
//                .foregroundColor(.white)
//                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                .font(.system(size: 20))){
                ){
                
                Text(new[2].description)
                    .foregroundColor(.gray)
                    .font(.system(size:15))
                }
            }.foregroundColor(.white)
            .font(.system(size: 20))
            
            
        }
    }
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(new: news)
    }
}
extension UIColor {
    
    static let flatDarkBackground = UIColor(red: 36, green: 36, blue: 36)
    static let flatDarkCardBackground = UIColor(red: 11, green: 77, blue: 184)
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }
}

extension Color {
    public init(decimalRed red: Double, green: Double, blue: Double) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255)
    }
    
    public static var flatDarkBackground: Color {
        return Color(decimalRed: 36, green: 36, blue: 36)
    }
    
    public static var flatDarkCardBackground: Color {
        return Color(decimalRed: 4, green: 44, blue: 107)
    }
}
