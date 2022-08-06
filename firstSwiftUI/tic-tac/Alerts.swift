//
//  Alerts.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 06/08/2022.
//

import Foundation

struct AlertItem:Identifiable{
    let id = UUID()
    let title,message,btnTiltle : String
}
struct AlertContext{
   static let win = AlertItem(title: "Your Win!", message: "you are smart.", btnTiltle: "Hell Yeah")
    static let computerWin = AlertItem(title: "you lost", message: "you programmed a super AI", btnTiltle: "Hell Yeah")
    static let draw = AlertItem(title: "Draw", message: "what a battle wits we have here ", btnTiltle: "Try Again")
}
