//
//  QuestionView.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 04/05/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var game: GameState
    @State var timeRemaining = 3
    @State var sound = soundManage()
    

    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Spacer()
            Text(game.questions[0].question)
                .font(
                    .custom("Montserrat-Bold", size: 20)
            )
                .padding(20)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .onReceive(timer) { _ in
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    }
                    if self.timeRemaining == 0 {
                        self.game.optionsShow = true
                    }
            }
            Spacer()
        }.onAppear {
            self.sound.startSound()
        }
    }
}

//struct QuestionView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionView(optionsShow: .constant(true), gameStart: .constant(true), question: "Hello")
//    }
//}
