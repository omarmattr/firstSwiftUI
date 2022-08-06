//
//  GameViewModel.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 06/08/2022.
//

import SwiftUI

final class GameViewModel:ObservableObject{
    var columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    @Published var moves : [Move?] = Array(repeating: nil, count: 9)
    @Published var isHuman = true
    @Published var isDisabled = false
    @Published var alertItem:AlertItem?
    let winPattern : Set<Set<Int>> = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    func onCkick(_ i:Int){
        guard  moves[i] == nil else{
            return
        }
        
        moves[i] = Move(player: .human , index: i)
        isDisabled = true
        if checkwinCondition(for: .human) {
            alertItem = AlertContext.win
            
            return
        }
        if checkForDraw() {
            alertItem = AlertContext.draw
            return
        }
        DispatchQueue.main.asyncAfter(deadline : .now()+0.5){ [self] in
            let index = computerMove()
            moves[index ] = Move(player: .computer , index:  index)
            isDisabled = false
            if checkwinCondition(for: .computer) {
                alertItem = AlertContext.computerWin
                return
            }
            if checkForDraw() {
                alertItem = AlertContext.draw
                
                return
            }
        }
        
    }
    func checkwinCondition(for player:Player)->Bool{
        let playerMoves = moves.compactMap{$0}.filter{ $0.player == player}
        let playerPattern = Set(playerMoves.map {$0.index})
        for pattern in winPattern where pattern.isSubset(of: playerPattern){
            return true
        }
        return false
    }
    func checkForDraw()->Bool{
        return  moves.compactMap{$0}.count == 9
    }
    func resetGame(){
        moves = Array(repeating: nil, count: 9)
        isHuman = true
        isDisabled = false
    }
    func isSquareOccupied(forIndex index:Int)->Bool{
        return moves.contains(where:{$0?.index == index})
    }
    func computerMove()->Int{
            // If AI can win,then win
            let computerMoves=moves.compactMap{$0}.filter{$0.player == .computer}
            let computerPositions=Set(computerMoves.map{$0.index})
            for pattern in winPattern{
                let winPositions=pattern.subtracting(computerPositions)
                if winPositions.count == 1{
                    let isAvaiable = !isSquareOccupied(forIndex:winPositions.first!)
                    if isAvaiable{return winPositions.first!}
                }
                
            }
            // If AI can't win,then block
            let humanMoves=moves.compactMap{$0}.filter{$0.player == .human}
            let humanPositions=Set(humanMoves.map{$0.index})
            for pattern in winPattern{
                let winPositions=pattern.subtracting(humanPositions)
                if winPositions.count == 1{
                    let isAvaiable = !isSquareOccupied(forIndex:winPositions.first!)
                    if isAvaiable{return winPositions.first!}
                }
                
            }
            // If AI can't block,then take middle square
            let centerSquare = 4
            if !isSquareOccupied(forIndex:centerSquare){
                return centerSquare
            }
            // If AI can't take middle square,take random available square
            var movePosition=Int.random(in:0..<9)
            while isSquareOccupied(forIndex:movePosition){
                movePosition=Int.random(in:0..<9)
                
            }
            return movePosition
        }
}
