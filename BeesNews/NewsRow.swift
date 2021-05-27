//
//  NewsRow.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 1/27/21.
//
//Displays a single News article.
import SwiftUI



struct NewsRow: View {
    var new: Value
    @State private var showConnectionAlert = false
    var body: some View {

        /*Button(action: { self.showConnectionAlert = true }){*/
        
        ZStack{
            Color.flatDarkCardBackground
            HStack{
                VStack(spacing: 15){
                    RemoteImage(url: new.media ?? "https://media-exp1.licdn.com/dms/image/C560BAQHMnA03XDdf3w/company-logo_200_200/0/1519855918965?e=2159024400&v=beta&t=CrP5Le1mWICRcaxIGNBuajHcHGFPuyNA5C8DI339lSk")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    
                }.frame(width: 150, height: 159, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                VStack(spacing: 15){
                    DisclosureGroup(
                        new.title!
                        //                .foregroundColor(.white)
                        //                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        //                .font(.system(size: 20))){
                    ){
                        
                        Text(new.summary!)
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                            .bold()
                    }
                }.foregroundColor(.white)
                .font(.system(size: 20))
                .padding(.horizontal, 5)
                
                
            }.padding(15)
            
        }.clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: Color.flatDarkCardBackground, radius: 5, x: 5, y:5)
        /*}.alert(isPresented: $showConnectionAlert) {
    Alert(title: Text("Nice"),
          message: Text("The alert is showing!"),
          dismissButton: Alert.Button.default(Text("OK"),
                                              action: { self.showConnectionAlert = false }))*/
        
            
    
}
}




struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(new: (news_object?.articles[2])!)
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
