//
//  InfoBoxesView.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 04/05/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//

import SwiftUI

struct InfoBoxesView: View {
    @EnvironmentObject var game: GameState
    func resetScore(){
        //print(game.questions.count)
        if game.resetGame {
            self.game.score = 0
        }
        
        if self.game.score == 0 {
            game.resetGame = false
        }
    }
    var body: some View {
        HStack {
            QuestionInfoView()
            Spacer()
            TimeInfoView()
            Spacer()
            ScoreInfoView().onAppear(perform: resetScore)
        }.padding(15)
    }
}

struct InfoBoxesView_Previews: PreviewProvider {
    static var previews: some View {
        InfoBoxesView()
    }
}
