//
//  QuestionInfoView.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 04/05/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//

import SwiftUI

struct QuestionInfoView: View {
    @EnvironmentObject var game: GameState
    var body: some View {
        Text("Question\n \(game.round) / 7")
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

struct QuestionInfoView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionInfoView()
    }
}
