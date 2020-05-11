//
//  TestView.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 01/05/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//

import CoreData
import SwiftUI


struct DetailView: View {
    @EnvironmentObject var game: GameState
    
    var body: some View {
       
        FilteredGame(filter: game.id)
        
    }
}


//struct AnimateDemo: View {
//    @FetchRequest(entity: GameHistory.entity(), sortDescriptors: []) var games: FetchedResults<GameHistory>
//
//    @State var showingDetail = false
//
//    var body: some View {
//        VStack {
//            List {
//                ForEach(games, id: \.id) { game in
//                    VStack {
//                        Text(game.question ?? "Unknown")
//                        Text(game.option_chosen ?? "Unknown")
//                    }
//                }
//            }
//        }
//    }
//}

struct CapsuleAnswer: View {
    var text: String
    var correct: Bool
    //var bgColor: Color
    
    var body: some View {
        Text(text)
            .font(.custom("Montserrat-SemiBold", size: 20))
            .foregroundColor(Color(red:0.07, green: 0.1, blue: 0.16))
            .zIndex(10)
            .frame(width: 175, height: 40)
            .background(correct ? Color.green : Color.red )
            .cornerRadius(50)
    }
}

struct CapsuleDetails: View {
    //var questionNum: Int
    var question: String
    var answer: String
    var correctAnswer: Bool
    
    var body: some View {
        VStack {
            VStack {
                Text(question)
                    .font(.custom("Montserrat-SemiBold", size: 15))
                    .multilineTextAlignment(.center)
                    .padding(10)
            }
            VStack {
                Text("You answered")
                    .font(.custom("Montserrat-SemiBold", size: 10))
                    .multilineTextAlignment(.center)
                    .padding(10)
            }
            
            VStack {
                CapsuleAnswer(text: answer, correct: correctAnswer)
                    .padding(10)
            }
        }.frame(width: 335.0, height: 250)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.white, lineWidth: 2)
        )
    }
}

struct FilteredGame: View {
    var fetchRequest: FetchRequest<GameHistory>
    
    var body: some View {
//        VStack {
//        List(fetchRequest.wrappedValue, id: \.self) { gamehistory in
//            Text("\(gamehistory.wrappedQuestion) \n \(gamehistory.wrappedOptionChosen)")
//        }
//        }
        
        
        ScrollView {
                    ForEach(fetchRequest.wrappedValue, id: \.self) { game in
                        VStack {
                            CapsuleDetails(question: game.wrappedQuestion, answer: game.wrappedOptionChosen, correctAnswer: game.wrappedCorrectOption)
                        }
                    }
                }
    }
    
    init(filter: String) {
        fetchRequest = FetchRequest<GameHistory>(entity: GameHistory.entity(), sortDescriptors: [], predicate: NSPredicate(format: "gameId == %@", filter))
    }
}


//struct GameDetails: View {
//    @State var game_id: String
//    @EnvironmentObject var game: GameState
//    //var game_id: UUID
//
//
//    @FetchRequest var gameHistory: FetchedResults<GameHistory>
//
//    //    @FetchRequest(entity: GameHistory.entity(), sortDescriptors: [], predicate: NSPredicate(format: "game_id == '\(game.id)'")) var games: FetchedResults<GameHistory>
//
//    init() {
//        //game_id = game.id
//        //let game_id = "ji"
//
//        //let id = Optional(game.id)
//        var predicate: NSPredicate?
//        // Can do some control flow to change the predicate here
//        //predicate = NSPredicate(format: "game_id %@", game_id as CVarArg)
//
//        self._gameHistory = FetchRequest(
//            entity: GameHistory.entity(),
//            sortDescriptors: [],
//            predicate: predicate
//        )
//    }
//
//
//
//
//    var body: some View {
//        ScrollView {
//            ForEach(gameHistory, id: \.id) { game in
//                VStack {
//                    CapsuleDetails(question: game.question ?? "Unknown", answer: game.option_chosen ?? "Unknown", correctAnswer: game.correct_option)
//                }
//            }
//        }
//    }
//}
//
//struct AnimateDemo_Previews: PreviewProvider {
//    static var previews: some View {
//        GameDetails()
//    }
//}
