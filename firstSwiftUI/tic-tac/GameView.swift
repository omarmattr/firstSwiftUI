//
//  TicTAc.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 06/08/2022.
//

import SwiftUI

struct GameView: View {
   @StateObject private var viewModel = GameViewModel()
    var body: some View {
        GeometryReader{geo in
            VStack{
                Spacer()
                LazyVGrid(columns: viewModel.columns, spacing: 12){
                    ForEach (0..<9) {i in
                        ZStack{
                            Circle().foregroundColor(.green).opacity(0.5).frame(width: geo.size.width/3-15, height: geo.size.width/3-15)
                            Image(systemName: viewModel.moves[i]?.image ?? "").resizable().frame(width: 40, height: 40).foregroundColor(.white)
                                .onTapGesture {
                                    viewModel.onCkick(i)
                                }
                        }
                    }
                }
                Spacer()
            }
            .disabled(viewModel.isDisabled)
            .padding()
            .alert(item: $viewModel.alertItem) { item in
                Alert(title: Text(item.title), message: Text(item.message), dismissButton: .default(Text(item.btnTiltle), action: {
                    viewModel.resetGame()
                }))
            }
        }
    }
   
    }
    enum Player{
        case human , computer
    }
    struct Move{
        let player : Player
        let index:Int
        var image:String {
            return player == .human ? "xmark" : "circle"
        }
    }
    
    struct TicTAc_Previews: PreviewProvider {
        static var previews: some View {
            GameView()
        }
    }
