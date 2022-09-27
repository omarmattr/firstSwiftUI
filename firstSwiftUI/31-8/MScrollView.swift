//
//  ScrollView.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 31/08/2022.
//

import SwiftUI

struct MScrollView: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: true,content: {
            LazyVStack{
                ForEach(0..<20) { index in
                    ScrollView(.horizontal,showsIndicators: true,content: {
                        LazyHStack{
                            ForEach(0..<20) { index in
                                Rectangle()
                                    .frame(width: 200,height: 150)
                                    .cornerRadius(20)
                                    .shadow(radius: 10)
                                    .padding(16)
                                    .foregroundColor(.white)
                                
                            }
                            
                        }
                        
                    })
                    
                }
            }
        })
        
    }
}

struct MScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MScrollView()
    }
}
