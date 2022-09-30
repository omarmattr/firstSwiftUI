//
//  MyStepper.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 26/09/2022.
//

import SwiftUI

struct MyStepper: View {
    @State var isAnimate = false
    @State var sValue = 10
    var body: some View {
        VStack{
            Stepper("value is : \(sValue)", value: $sValue).padding(.horizontal).onSubmit {
                withAnimation {
                    isAnimate.toggle()
                }
            }
            Rectangle().frame(width: 100,height: 100).cornerRadius(CGFloat(isAnimate ? sValue : sValue-10))
        
           
        }
    }
}

struct MyStepper_Previews: PreviewProvider {
    static var previews: some View {
        MyStepper()
    }
}
