//
//  SoloView.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 30/04/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//

import SwiftUI
import UIKit
import AVFoundation


struct SoloView: View {
    @EnvironmentObject var game: GameState
    @State var sound = soundManage()
    
    
    var body: some View {
        
        return Group {
            if game.questions.count > 0 {
                if game.start {
                    //self.sound.correctSound()
                    InfoBoxesView()
                    QuestionView()
                    if game.optionsShow {
                        OptionsView()
                    }
                } else {
                    InfoBoxesView()
                    TimerView()
                }
            } else {
                ScoreView()
            }
        }
    }
}

struct CapsuleOption: View {
    var text: String
    var bgColor: Color
    
    var body: some View {
        Text(text)
            .font(.custom("Montserrat-SemiBold", size: 30))
            .foregroundColor(Color(red:0.07, green: 0.1, blue: 0.16))
            .minimumScaleFactor(0.1)
            .lineLimit(0)
            .padding(10)
            .zIndex(10)
            .frame(width: 335.0, height: 80)
            .background(bgColor)
            .cornerRadius(25)
    }
}

//struct CapsuleAnswer: View {
//    var text: String
//    var positionChosen: Int
//    var correctAnswer: Bool
//    
//    var body: some View {
//        VStack {
//            ForEach(0 ..< (0+(positionChosen-1))) {_ in
//                Spacer()
//            }
//            CapsuleOption(text: text, bgColor: correctAnswer ? Color(red:0, green: 1, blue: 0.39) : Color(red:0.83, green: 0.12, blue: 0.12)
//            )
//            Spacer()
//            ForEach(0 ..< (4-positionChosen)) {_ in
//                Spacer()
//            }
//        }
//    }
//}

struct soundManage {
    var soundEffect: AVAudioPlayer?
    
    
    mutating func correctSound() {
        
        let path = Bundle.main.path(forResource: "correct_button.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            soundEffect?.play()
        } catch {
            print("could not load file")
        }
    }
    
    mutating func incorrectSound() {
        let path = Bundle.main.path(forResource: "incorrect_button.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            soundEffect?.play()
        } catch {
            print("could not load file")
        }
    }
    
    mutating func questionSound() {
        let path = Bundle.main.path(forResource: "question.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            soundEffect?.play()
        } catch {
            print("could not load file")
        }
    }
    
    mutating func startSound() {
        let path = Bundle.main.path(forResource: "whistle.aiff", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            soundEffect?.play()
        } catch {
            print("could not load file")
        }
    }
}

struct OptionsView: View {
    @EnvironmentObject var game: GameState
    @State var answered = false
    @State private var optionCorrect = false
    @State private var optionChosen = ""
    @State var chosen = "default"
    @State var answerColor = Color.white
    @Environment(\.managedObjectContext) var moc
    @State var sound = soundManage()
    

    
     func userChoice(correctChoice: Bool) {
        game.stopTimer = true
        if correctChoice {
            game.score += 3 * game.timeRemaining
            game.correctAnswer = true
            self.answerColor = Color.green
            self.sound.correctSound()
            
            
        } else {
            game.correctAnswer = false
            self.answerColor = Color.red
            self.sound.incorrectSound()
        }
        answered = true
        //self.game.restartRound()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.game.restartRound()
        }
    }
     
    func saveResponse(optionChosen:String, question:String, correctOption: Bool) {
        let gameHistory = GameHistory(context: self.moc)
        gameHistory.gameId = game.id
        
        gameHistory.optionChosen = optionChosen
        gameHistory.question = question
        gameHistory.correctOption = correctOption
        
        try? self.moc.save()
    }
    
    
    
    var body: some View {
        
        VStack {
            
            ForEach(0 ..< game.questions[0].options.count) {option in
                VStack {
                    // CC7E6D5D-0F47-492C-AA53-01248B536477
                    Button(action: {
                        
                        print(self.game.id)
                        self.userChoice(correctChoice: self.game.questions[0].options[option].correctOption)
                        self.game.questions[0].options[option].optionTouched = true
                        self.saveResponse(optionChosen: self.game.questions[0].options[option].name, question: self.game.questions[0].question, correctOption: self.game.questions[0].options[option].correctOption)
                    }) {
                        CapsuleOption(text: "\(self.game.questions[0].options[option].name)",
                            bgColor: self.answered ? self.game.questions[0].options[option].optionTouched ? self.answerColor : Color(red:0.07, green: 0.1, blue: 0.16)
                                : Color.white)
                    }.disabled(self.answered)
                    Spacer()
                }
            }
            //            ForEach(game.questions[0].options, id: \.id) { option in
            //                VStack {
            //                    Button(action: {
            //                        self.userChoice(correctChoice: option.correctOption)
            //                        option.optionTouched = true
            //                        //option.touched()
            //                        //self.chosen = option
            //                        print(option)
            //                    }) {
            //                        CapsuleOption(text: "\(option.name)",
            //                            bgColor: self.answered ? option.optionTouched ? self.answerColor : Color(red:0.07, green: 0.1, blue: 0.16)
            //
            //                                : Color.white)
            //                    }.disabled(self.answered)
            //                    Spacer()
            //                }
            //            }
        }.padding(10)
    }
}


//struct ShowCorrectAnswer: View {
////    var options = [
////        Options(option: "Liverpool", correctOption: true, optionTouched: false),
////        Options(option: "Real madrid", correctOption: false, optionTouched: false),
////        Options(option: "Man City", correctOption: false, optionTouched: false),
////        Options(option: "Totteham", correctOption: false, optionTouched: false)
////    ]
//    
//    var body: some View {
//        VStack {
//            ForEach(options, id: \.id) { option in
//                VStack {
//                    Text("HEllo")
//                }
//            }
//        }
//    }
//}

struct CorrectOption: View {
    var body: some View {
        Text("Correct answer")
    }
}

struct WrongOption: View {
    var body: some View {
        Text("Wrong answer")
    }
}









struct GameOnView: View {
    var body: some View {
        ZStack {
            Text("Hello")
        }
    }
}



//!self.answered ? self.answerColor :
//
//
//self.chosen == self.question.correctOption ? self.answerColor : Color(red:0.07, green: 0.1, blue: 0.16)




//struct SoloView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        OptionsView(, question: <#Question#>)
//    }
//}

