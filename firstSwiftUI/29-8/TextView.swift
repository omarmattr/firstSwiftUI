//
//  TextView.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 29/08/2022.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        Text("Hello, World!")
            .font(.system(size: 24,design: .serif))
            .underline(true,color: .blue)
            .italic()
            .strikethrough()
            .baselineOffset(10)
            .kerning(3)
            .frame(width: 100.0, height: 200.0)
            .foregroundColor(.red)
            
            
            
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
