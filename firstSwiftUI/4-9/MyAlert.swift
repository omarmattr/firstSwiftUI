//
//  SwiftUIView.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 04/09/2022.
//

import SwiftUI

struct MyAlert: View {
    @State var isAlert  = false
    @State var isActionSheet  = false

    var body: some View {
        ZStack{
           // Color.yellow.edgesIgnoringSafeArea(.all)
            Button("omar"){
               // isActionSheet.toggle()
            }
            .alert(isPresented: $isAlert) {
                Alert(title: Text("hello"), primaryButton: .cancel(), secondaryButton: .destructive(Text("DELETE"),action: {
                    
                }))
            }
        }.actionSheet(isPresented: $isActionSheet) {
            let btn1 : ActionSheet.Button = .default(Text("return"))
            let btn2 : ActionSheet.Button = .destructive(Text("return"))
            let btn3 : ActionSheet.Button = .default(Text("return"))
            let btn4 : ActionSheet.Button = .cancel()


            return ActionSheet(title: Text("sssss"),buttons: [btn1,btn2,btn3,btn4])
        }
        .padding(40)
        .background(.red)
        .contextMenu {
            Text("jhgjhjh")
            Text("jhgjhjh")
            Button("omar"){
                isActionSheet.toggle()
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MyAlert()
    }
}
