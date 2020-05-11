//
//  ContentView.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 30/04/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//

import SwiftUI


//struct ContentView: View {    
//    @available(iOS 13.0.0, *)
//    @State var playSoloBtn = false
//    
//    var body: some View {
//        ZStack {
//            //Background color
//            Color(red:0.07, green: 0.1, blue: 0.16)
//                .edgesIgnoringSafeArea(.all)
//            //Header
//            VStack() {
//                Image("settings")
//                Text("Settings")
//                .font(
//                .custom("Montserrat-Bold", size: 10))
//                .foregroundColor(Color.white)
//                Spacer()
//            }.padding(.top, 20).offset(x:150)
//            //Middle section
//            VStack(alignment: .center, spacing: 30) {
//                Image("football-ball")
//                Text("Footy quiz")
//                    .font(
//                    .custom("Montserrat-Bold", size: 40))
//                    .foregroundColor(Color.white)
//                Button(action: {
//                    self.playSoloBtn = true
//                }) {
//                    Text("Play solo")
//                        .font(.custom("Montserrat-SemiBold", size: 30))
//                        .foregroundColor(Color.white)
//                }
//                .frame(width: 335.0, height: 80.0)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 20)
//                        .stroke(Color.white, lineWidth: 5)
//                )
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
//                    Text("Play vs friend")
//                        .font(.custom("Montserrat-SemiBold", size: 30))
//                        .foregroundColor(Color.white)
//                }
//                .frame(width: 335.0, height: 80.0)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 20)
//                        .stroke(Color.white, lineWidth: 5)
//                )
//            }
//        
//        }
//    }
//    
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(playSoloBtn: false)
//    }
//}
