//
//  InfoBoxesView.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 04/05/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//

import SwiftUI

struct InfoBoxesView: View {
    var body: some View {
        HStack {
            QuestionInfoView()
            Spacer()
            TimeInfoView()
            Spacer()
            ScoreInfoView()
        }.padding(15)
    }
}

struct InfoBoxesView_Previews: PreviewProvider {
    static var previews: some View {
        InfoBoxesView()
    }
}
