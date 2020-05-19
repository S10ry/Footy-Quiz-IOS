//
//  MainMenuView.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 01/05/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//

import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject var game: GameState
    //var connection = internetConnection()
    //@State var canPlay = false
    
    var body: some View {
        return Group {
            if game.solo {
                SoloView()
            } else {
                ZStack {
                    //Background color
                    Color(red:0.07, green: 0.1, blue: 0.16)
                        .edgesIgnoringSafeArea(.all)
                    //Header
                    VStack() {
                        Image("settings")
                        Text("Settings")
                            .font(
                                .custom("Montserrat-Bold", size: 10))
                            .foregroundColor(Color.white)
                        Spacer()
                    }.padding(.top, 20).offset(x:150)
                    //Middle section
                    VStack(alignment: .center, spacing: 30) {
                        Image("football-ball")
                        Text("Footy quiz")
                            .font(
                                .custom("Montserrat-Bold", size: 40))
                            .foregroundColor(Color.white)
                        Button(action: {
                            self.game.solo = true
                        }) {
                            Text("Play solo")
                                .font(.custom("Montserrat-SemiBold", size: 30))
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 335.0, height: 80.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 5)
                        )
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Play vs friend")
                                .font(.custom("Montserrat-SemiBold", size: 30))
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 335.0, height: 80.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 5)
                        )
                    }
                    
                }
            }
        }
        .onAppear(perform: game.getQuestions)
        .statusBar(hidden: true)
        .background(Color(red:0.07, green: 0.1, blue: 0.16)).edgesIgnoringSafeArea(.all)
    }
}
    
//    func getConnectionStatus() {
//        connection.viewDidLoad()
//    }
//
    
    
//    func getQuestions() {
//        // getConnectionStatus()
//        guard let url = URL(string: "https://www.footyquiz.io/api/v1/questions/random") else {
//            print("Invalid URL")
//            return
//        }
//        
//        let request = URLRequest(url: url)
//        var options = [Option]()
//        
//        URLSession.shared.dataTask(with: request) { data, response, error  in
//            if let data = data {
//                if let decodedResponse = try? JSONDecoder().decode(Results.self, from: data) {
//                    decodedResponse.results.forEach { APIQuestion in
//                        APIQuestion.options.forEach { APIOption in
//                            DispatchQueue.main.async {
//                                options.append(Option(id: UUID(), name: APIOption.name, correctOption: APIOption.correctOption, optionTouched: false))
//                            }
//                        }
//                        DispatchQueue.main.async {
//                            self.game.questions.append(Question(id: UUID(), question: APIQuestion.question, options: options))
//                            options = []
//                        }
//                    }
//                }
//            }
//        }.resume()
//    }
//}




//struct MainMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainMenuView()
//    }
//}


// var mainMenu = MainMenuView()
//        let internetConnection = connection()
//
//
//
//
//        if (internetConnection.getConnection()) {
//            print(iConnection.getConnection())
//            guard let url = URL(string: "https://www.footyquiz.io/api/v1/questions/random") else {
//                print("Invalid URL")
//                return
//            }
//
//            let request = URLRequest(url: url)
//            var options = [Option]()
//
//            URLSession.shared.dataTask(with: request) { data, response, error  in
//                if let data = data {
//                    if let decodedResponse = try? JSONDecoder().decode(Results.self, from: data) {
//                        decodedResponse.results.forEach { APIQuestion in
//                            APIQuestion.options.forEach { APIOption in
//                                DispatchQueue.main.async {
//                                    options.append(Option(id: UUID(), name: APIOption.name, correctOption: APIOption.correctOption, optionTouched: false))
//                                }
//                            }
//                            DispatchQueue.main.async {
//                                self.game.questions.append(Question(id: UUID(), question: APIQuestion.question, options: options))
//                                options = []
//                            }
//                            //
//
//                            //print(self.questions)
//
//                        }
//                    }
//                }
//            }.resume()
//            mainMenu.canPlay = true
//            //mainMenu.$canPlay = true
//        } else {
//            print("A network connection is required to play Footy Quiz")
//            mainMenu.canPlay = false
//        }
//    }
