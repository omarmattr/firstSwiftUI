//
//  Animation.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 31/08/2022.
//

import SwiftUI

struct Animation: View {
    @State var isAnimate = true
    @State var isSheet = true
    var body: some View {
        VStack{
            Rectangle()
                .fill(.red)
                .frame(width: isAnimate ? 300 : 100,height: isAnimate ? 200 : 100)
                .shadow(radius: 14)
                .cornerRadius(isAnimate ? 16 : 75)
            Spacer()
            Button("animate"){
                withAnimation {
                    isAnimate.toggle()
                }
                isSheet.toggle()
            }
        }.sheet(isPresented: $isSheet) {
            sheet1()
            
        }
    }
}

struct Animation_Previews: PreviewProvider {
    static var previews: some View {
        Animation()
    }
}

struct sheet1: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack{
            HStack{
                Button (action : {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .padding(16)
                        .font(.title)
                })
                Spacer()
            }
            
            MScrollView()
        }
    }
}
