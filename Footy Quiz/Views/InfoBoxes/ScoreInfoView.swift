//
//  ScoreInfoView.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 04/05/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//

import SwiftUI

struct ScoreInfoView: View {
    @EnvironmentObject var game: GameState
    
    var body: some View {
        Text("Score\n \(game.score)")
            .font(.custom("Montserrat-SemiBold", size: 10))
            .foregroundColor(Color.white)
            .multilineTextAlignment(.center)
            .frame(width: 90, height: 40)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(game.correctAnswer ? Color.green : Color.white, lineWidth: 2)
        )
    }
}

struct ScoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreInfoView()
    }
}
