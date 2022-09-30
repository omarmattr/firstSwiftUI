//
//  MyTabBar.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 26/09/2022.
//

import SwiftUI

struct MyTabBar: View {
    var body: some View {
        TabView{
            ZStack{
                Rectangle().foregroundColor(.red)
               // Color.red.ignoresSafeArea()
            }.tabItem {
                    Image(systemName: "smallcircle.filled.circle.fill")
                }
            
            Rectangle()
                .tabItem {
                    Image(systemName: "smallcircle.filled.circle.fill")
                }
            
            Rectangle().foregroundColor(.yellow)
                .tabItem {
                    Image(systemName: "smallcircle.filled.circle.fill")
                }
        }.tabViewStyle(.page)
    }
}

struct MyTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MyTabBar().preferredColorScheme(.light)
    }
}
