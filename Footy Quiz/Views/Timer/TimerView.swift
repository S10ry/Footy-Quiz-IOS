//
//  TimerView.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 04/05/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var game: GameState
    //@State private var timeRemaining = 3
    @State private var timeRemaining = 1
    
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Spacer()
            Text("Question \(game.round)")
            .font(
                    .custom("Montserrat-Bold", size: 50)
            )
                .foregroundColor(Color.white)
            Spacer()
            Text("\(timeRemaining)")
                .font(
                    .custom("Montserrat-Bold", size: 200)
            )
                .foregroundColor(Color.white)
                .onReceive(self.timer) { _ in
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    }
                    if self.timeRemaining == 0 {
                        
                        self.game.start = true
                        

                    }
            
            }
            Spacer()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}


//
//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerView()
//    }
//}
