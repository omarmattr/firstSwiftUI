//
//  ContentView.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 02/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                Text("Gaza")
                    .font(.system(size: 32,weight: .medium,design: .default))
                    .foregroundColor(.white)
                    .padding()
                    //.padding(.bottom,200)
                   // .frame(width: 200 , height: 300)
                    //.background(.blue)
                VStack{
                    Image(systemName:isNight ?"moon.stars.fill":"cloud.sun.fill").renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("32°").foregroundColor(.white).font(.system(size: 70,weight: .medium,design: .default))
                        
                }
                .padding(.bottom,40)
                HStack( spacing: 20){
                    ExtractedView(isNight: $isNight, day:"TUE",image: "cloud.sun.fill",temperature:"32")
                    ExtractedView(isNight: $isNight, day:"TUE",image: "cloud.sun.fill",temperature:"32")
                    ExtractedView(isNight: $isNight, day:"TUE",image: "cloud.sun.fill",temperature:"32")
                    ExtractedView(isNight: $isNight, day:"TUE",image: "cloud.sun.fill",temperature:"32")
                    ExtractedView(isNight: $isNight, day:"TUE",image: "cloud.sun.fill",temperature:"32")
                    ExtractedView(isNight: $isNight, day:"TUE",image: "cloud.sun.fill",temperature:"32")
                   

                }

            
                Spacer()
                Button{
                    isNight = !isNight
                    print(isNight)
                }label:{
                    Text("click me").foregroundColor(.red).font(.system(size: 20,weight: .medium,design: .default)).frame(width: 150, height: 40).background(.white).cornerRadius(16)
                        
                
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    @Binding  var isNight:Bool

    var day:String
    var image:String
    var temperature:String
    var body: some View {
        VStack{
            Text(day).foregroundColor(.white).font(.system(size: 16,weight: .medium,design: .default))
            Image(systemName: image).renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text(temperature).foregroundColor(.white).font(.system(size: 28,weight: .medium,design: .default))
            
        }
    }
}

struct BackgroundView: View {
    @Binding  var isNight:Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: isNight ?[.black,.black,.white]:[.blue,.white]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}
