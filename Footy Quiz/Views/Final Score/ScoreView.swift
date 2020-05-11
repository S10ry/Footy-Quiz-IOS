//
//  ScoreView.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 07/05/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var game: GameState
    var body: some View {
        return Group {
            if game.score > 104 {
                CapsuleScore(text: "WON", score: game.score)
            } else {
                CapsuleScore(text: "LOST", score: game.score)
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}

struct CapsuleScore: View {
    var text: String
    var score: Int
    @State var showingDetail = false
    @EnvironmentObject var game: GameState
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        return Group {
            if text == "WON" {
                HStack {
                    VStack {
                        VStack {
                            Text("WON!")
                                .font(.custom("Montserrat-ExtraBold", size: 100))
                                .foregroundColor(Color(red:1, green: 0, blue: 0.5))
                                .shadow(color: Color(red:0.26, green: 0.96, blue: 0), radius: 0, x: 3, y: 6)
                        }.zIndex(10)
                        Spacer()
                        VStack {
                            Text("Score").font(.custom("Montserrat-SemiBold", size: 50))
                            Text("\(score)")
                                .font(.custom("Montserrat-SemiBold", size: 100))
                        }.foregroundColor(Color(red:0.07, green: 0.1, blue: 0.003))
                            .multilineTextAlignment(.center)
                            .zIndex(10)
                            .frame(width: 335.0, height: 250)
                            .background(Color(red: 0, green: 1, blue: 0))
                            .shadow(color: Color(red: 0, green: 1, blue: 0), radius: 30, x: 4, y: -4)
                            .cornerRadius(25)
                        Spacer()
                        VStack {
                            Text("Play again").font(.custom("Montserrat-SemiBold", size: 30))
                                .foregroundColor(Color.white)
                                .zIndex(10)
                                .frame(width: 335.0, height: 80)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 5))
                        }
                        Spacer()
                        VStack {
                            Button(action: {
                                self.showingDetail.toggle()
                            }) {
                                    Text("Game details").font(.custom("Montserrat-SemiBold", size: 30))
                                    .foregroundColor(Color.white)
                                    .zIndex(10)
                                    .frame(width: 335.0, height: 80)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.white, lineWidth: 5))
                            }.sheet(isPresented: $showingDetail) {
                                DetailView().environmentObject(self.game).environment(\.managedObjectContext, self.moc)
                            }
                            
                        }.padding(.bottom, 20)
                    }
                }
            } else {
                HStack {
                    VStack {
                        VStack {
                            Text("LOST!")
                                .font(.custom("Montserrat-ExtraBold", size: 100))
                                .foregroundColor(Color(red:0.71, green: 0.38, blue: 0.91))
                                .shadow(color: Color(red:0.96, green: 0, blue: 0), radius: 0, x: 3, y: 6)
                        }.zIndex(10)
                        Spacer()
                        VStack {
                            Text("Score").font(.custom("Montserrat-SemiBold", size: 50))
                            Text("\(score)")
                                .font(.custom("Montserrat-SemiBold", size: 100))
                        }.foregroundColor(Color(red:0.07, green: 0.1, blue: 0.16))
                            .multilineTextAlignment(.center)
                            .zIndex(10)
                            .frame(width: 335.0, height: 250)
                            .background(Color(red: 0.96, green: 0, blue: 0))
                            .shadow(color: Color(red:0.61, green: 0.22, blue: 0.22), radius: 30, x: 4, y: -4)
                            .cornerRadius(25)
                        Spacer()
                        
                        VStack {
                            Text("Play again").font(.custom("Montserrat-SemiBold", size: 30))
                                .foregroundColor(Color.white)
                                .zIndex(10)
                                .frame(width: 335.0, height: 80)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 5))
                        }
                        VStack {
                            Button(action: {
                                self.showingDetail.toggle()
                            }) {
                                    Text("Game details").font(.custom("Montserrat-SemiBold", size: 30))
                                    .foregroundColor(Color.white)
                                    .zIndex(10)
                                    .frame(width: 335.0, height: 80)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.white, lineWidth: 5))
                            }.sheet(isPresented: $showingDetail) {
                                DetailView().environmentObject(self.game).environment(\.managedObjectContext, self.moc)
                            }
                            
                        }.padding(.bottom, 20)
                    }
                }
            }
        }
    }
}



struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleScore(text: "WON", score: 50)
    }
}
