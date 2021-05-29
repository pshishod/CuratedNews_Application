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
    /*var NewsAgency : String
    var title : String
    var summary : String*/

    @State private var showConnectionAlert = false
    var body: some View {

        /*Button(action: { self.showConnectionAlert = true }){*/
        
        ZStack{
            Color.flatDarkCardBackground
            HStack{
                VStack(spacing: 0){
                    RemoteImage(url: new.media ?? "https://media-exp1.licdn.com/dms/image/C560BAQHMnA03XDdf3w/company-logo_200_200/0/1519855918965?e=2159024400&v=beta&t=CrP5Le1mWICRcaxIGNBuajHcHGFPuyNA5C8DI339lSk")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    
                }.frame(width: 100, height: 100, alignment: .topLeading)
                VStack(spacing: 0){
                    DisclosureGroup(
                        new.title!
                    ){
                        
                        Text(new.title!)
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                            .bold()

                            
                    }
                }.foregroundColor(.white)
                .font(.system(size: 20))
                .padding(.horizontal, 5)
                .frame(width:.infinity, height: 150, alignment: .topLeading)
                
                
            }.padding(4)
            
        }.clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: Color.flatDarkCardBackground, radius: 5, x: 5, y:5)
        /*}.alert(isPresented: $showConnectionAlert) {
    Alert(title: Text("Nice"),
          message: Text("The alert is showing!"),
          dismissButton: Alert.Button.default(Text("OK"),
                                              action: { self.showConnectionAlert = false }))*/
        
            
    
}
}




/*struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(NewsAgency : "New York Times", title: "Florida man goes to town on sandwich and then has an epiphany to make sandy nuggets. Where the sandwich is in the form of a nugget.", summary : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et tortor consequat id porta. Viverra orci sagittis eu volutpat odio facilisis mauris sit amet. In hendrerit gravida rutrum quisque non tellus orci ac. Velit euismod in pellentesque massa placerat duis ultricies lacus sed. Tortor at risus viverra adipiscing at in. Condimentum id venenatis a condimentum vitae sapien pellentesque habitant. Tortor aliquam nulla facilisi cras fermentum odio eu feugiat. Tellus in hac habitasse platea dictumst vestibulum rhoncus est. Tincidunt tortor aliquam nulla facilisi. Eu lobortis elementum nibh tellus. Nibh ipsum consequat nisl vel pretium lectus quam id leo. Ac tortor vitae purus faucibus ornare. Feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam. Integer quis auctor elit sed vulputate mi sit.Sed odio morbi quis commodo odio aenean sed. Purus gravida quis blandit turpis cursus. Aliquet eget sit amet tellus cras adipiscing enim. Faucibus nisl tincidunt eget nullam non nisi est sit amet. Vulputate enim nulla aliquet porttitor. Nunc sed blandit libero volutpat sed cras ornare arcu dui. Non tellus orci ac auctor augue mauris augue neque gravida. Viverra vitae congue eu consequat ac felis donec et odio. Sit amet tellus cras adipiscing enim eu turpis egestas. Rhoncus dolor purus non enim praesent. Vitae congue eu consequat ac felis. Ut lectus arcu bibendum at varius vel pharetra vel turpis. Praesent semper feugiat nibh sed. At ultrices mi tempus imperdiet. Nunc eget lorem dolor sed viverra ipsum nunc aliquet bibendum.Sed adipiscing diam donec adipiscing tristique. Quis enim lobortis scelerisque fermentum dui faucibus. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Ipsum faucibus vitae aliquet nec ullamcorper sit amet. Est placerat in egestas erat imperdiet sed. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Vivamus arcu felis bibendum ut tristique. Eu feugiat pretium nibh ipsum consequat nisl. Diam quam nulla porttitor massa id neque aliquam vestibulum. Leo in vitae turpis massa sed elementum tempus egestas sed. Neque laoreet suspendisse interdum consectetur libero. At volutpat diam ut venenatis. Dapibus ultrices in iaculis nunc sed augue lacus viverra. Duis convallis convallis tellus id interdum velit laoreet id. Neque sodales ut etiam sit amet nisl purus in.")
    }
}*/






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
