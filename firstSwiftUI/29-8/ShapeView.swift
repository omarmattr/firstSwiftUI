//
//  ShapeView.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 29/08/2022.
//

import SwiftUI

struct ShapeView: View {
    var body: some View {
        Circle()
            .trim(from: 0.3, to: 1)//.stroke(Color.yellow,lineWidth:20)
            .stroke(Color.orange,style:StrokeStyle(lineWidth: 10, lineCap: CGLineCap.round,  dash: [100]))
            .shadow(color: .orange, radius: 10,x:0,y:5)
        
        //  .fill(Color.green)
        // .foregroundColor(.red)
        //  Ellipse()
        //      .frame(width: 200, height: 100, alignment: .bottom)
        // Capsule(style: RoundedCornerStyle.circular)
        // RoundedRectangle(cornerRadius: 10).frame(width: 200, height: 100, alignment: .bottom)
        
        
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView()
    }
}
