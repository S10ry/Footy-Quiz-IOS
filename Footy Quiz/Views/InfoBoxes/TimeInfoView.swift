//
//  TimeInfoView.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 04/05/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//

import SwiftUI

struct TimeInfoView: View {
    @EnvironmentObject var game: GameState
    @State var sound = soundManage()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            if self.game.optionsShow {
                
                Text("Time left\n \(self.game.timeRemaining)")
                    .font(.custom("Montserrat-SemiBold", size: 10))
                    .foregroundColor(Color.white)
                    .onReceive(timer) { _ in
                        if self.game.timeRemaining > 0  && !self.game.stopTimer {
                            self.game.timeRemaining -= 1
                            
                        }
                        if self.game.timeRemaining == 0 {
                            self.game.restartRound() 
                        }
                }
                .multilineTextAlignment(.center)
                .frame(width: 90, height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.white, lineWidth: 2)
                )
            } else {
                Text("Time left\n \(game.timeRemaining)")
                    .font(.custom("Montserrat-SemiBold", size: 10))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 90, height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 2)
                )
            }
        }
    }
}

struct TimeInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TimeInfoView()
    }
}
