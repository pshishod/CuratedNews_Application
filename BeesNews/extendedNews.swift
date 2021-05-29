//
//  extendedNews.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 5/26/21.
//

import SwiftUI

struct extendedNews: View {
    //Use below values to debug in preview
    
    /*var NewsAgency : String
     var title : String
     var description : String*/
    
    //Holds the value of the object of type Value
    var local_news_object : Value
    
    
    var body: some View {
        //Should be able to scroll down to read the entire news
        ScrollView{
            
            VStack(spacing:20){
                
                //Display the Publisher of the news
                VStack(alignment: .center){
                    Text(local_news_object.clean_url ?? "default_value")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }.frame(maxWidth : .infinity)
                
                //Add some padding
                HStack(spacing:20){
                    
                    Text("")
                    
                    //Display the Title of the news
                    HStack{
                        Text(local_news_object.title ?? "default_title").fontWeight(.bold)
                            .font(.system(size:40))
                    }.frame(maxWidth : .infinity,
                            alignment : .leading)
                    
                    Text("")
                    
                }
                //Display the Image for the News
                HStack(spacing : 20){
                    RemoteImage(url: local_news_object.media ?? "https://media-exp1.licdn.com/dms/image/C560BAQHMnA03XDdf3w/company-logo_200_200/0/1519855918965?e=2159024400&v=beta&t=CrP5Le1mWICRcaxIGNBuajHcHGFPuyNA5C8DI339lSk")
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                }
                
                //Display the text of the news
                HStack(spacing : 20){
                    Text("")
                    HStack{
                        Text(local_news_object.summary ?? "default_summary")
                    }
                    Text("")
                }
            }
            
            Spacer()
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        
        
        
    }
}

//Use below for debugginf purposes

/*struct extendedNews_Previews: PreviewProvider {
 static var previews: some View {
 extendedNews(NewsAgency : "New York Times", title: "Florida man goes to town on sandwich", description : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et tortor consequat id porta. Viverra orci sagittis eu volutpat odio facilisis mauris sit amet. In hendrerit gravida rutrum quisque non tellus orci ac. Velit euismod in pellentesque massa placerat duis ultricies lacus sed. Tortor at risus viverra adipiscing at in. Condimentum id venenatis a condimentum vitae sapien pellentesque habitant. Tortor aliquam nulla facilisi cras fermentum odio eu feugiat. Tellus in hac habitasse platea dictumst vestibulum rhoncus est. Tincidunt tortor aliquam nulla facilisi. Eu lobortis elementum nibh tellus. Nibh ipsum consequat nisl vel pretium lectus quam id leo. Ac tortor vitae purus faucibus ornare. Feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam. Integer quis auctor elit sed vulputate mi sit.Sed odio morbi quis commodo odio aenean sed. Purus gravida quis blandit turpis cursus. Aliquet eget sit amet tellus cras adipiscing enim. Faucibus nisl tincidunt eget nullam non nisi est sit amet. Vulputate enim nulla aliquet porttitor. Nunc sed blandit libero volutpat sed cras ornare arcu dui. Non tellus orci ac auctor augue mauris augue neque gravida. Viverra vitae congue eu consequat ac felis donec et odio. Sit amet tellus cras adipiscing enim eu turpis egestas. Rhoncus dolor purus non enim praesent. Vitae congue eu consequat ac felis. Ut lectus arcu bibendum at varius vel pharetra vel turpis. Praesent semper feugiat nibh sed. At ultrices mi tempus imperdiet. Nunc eget lorem dolor sed viverra ipsum nunc aliquet bibendum.Sed adipiscing diam donec adipiscing tristique. Quis enim lobortis scelerisque fermentum dui faucibus. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Ipsum faucibus vitae aliquet nec ullamcorper sit amet. Est placerat in egestas erat imperdiet sed. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Vivamus arcu felis bibendum ut tristique. Eu feugiat pretium nibh ipsum consequat nisl. Diam quam nulla porttitor massa id neque aliquam vestibulum. Leo in vitae turpis massa sed elementum tempus egestas sed. Neque laoreet suspendisse interdum consectetur libero. At volutpat diam ut venenatis. Dapibus ultrices in iaculis nunc sed augue lacus viverra. Duis convallis convallis tellus id interdum velit laoreet id. Neque sodales ut etiam sit amet nisl purus in.")
 }
 }*/
