//
//  GameStateClass.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 04/05/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//

import SwiftUI

struct Results: Codable {
    var results: [APIQuestion]
}

class GameState: ObservableObject {
    @Published var id = UUID().uuidString
    @Published var score = 0
    @Published var timeRemaining = 10
    @Published var round = 1
    @Published var stopTimer = false
    @Published var correctAnswer = false
    @Published var start = false
    @Published var optionsShow = false
    @Published var solo = false
    @Environment(\.managedObjectContext) var moc
    @Published var questions : [Question]
    @Published var online = false
    @Published var resetGame = false
    
    init() {
        questions =  [Question]()
    }
    
    func restartGame() {
        self.id = UUID().uuidString
        self.timeRemaining = 10
        self.round = 1
        self.stopTimer = false
        self.correctAnswer = false
        self.start = true
        self.optionsShow = false
        self.solo = true
        self.resetGame = true
        
        //self.score = 0
        self.getQuestions()
        
    }
    
    func getQuestions() {
    // getConnectionStatus()
    guard let url = URL(string: "https://www.footyquiz.io/api/v1/questions/random") else {
        print("Invalid URL")
        return
    }
    
    let request = URLRequest(url: url)
    var options = [Option]()
    
    URLSession.shared.dataTask(with: request) { data, response, error  in
        if let data = data {
            if let decodedResponse = try? JSONDecoder().decode(Results.self, from: data) {
                decodedResponse.results.forEach { APIQuestion in
                    APIQuestion.options.forEach { APIOption in
                        DispatchQueue.main.async {
                            options.append(Option(id: UUID(), name: APIOption.name, correctOption: APIOption.correctOption, optionTouched: false))
                        }
                    }
                    DispatchQueue.main.async {
                        self.questions.append(Question(id: UUID(), question: APIQuestion.question, options: options))
                        options = []
                    }
                }
            }
        }
    }.resume()
    }
    
    
    
    
    
    
    //print(questions)
    
    
    
    //    @Published var questions = [
    //        Question(question: "Which club won the Champions League in 2019?",
    //                 options: [
    //                             Option(name: "Liverpool", correctOption: true, optionTouched: false),
    //                             Option(name: "Real madrid", correctOption: false, optionTouched: false),
    //                             Option(name: "Man City", correctOption: false, optionTouched: false),
    //                             Option(name: "Totteham", correctOption: false, optionTouched: false)
    //                ]
    //        ),
    //
    //        Question(question: "Messi famously retired from international duty in which year before reversing his decision?",
    //                 options: [
    //                            Option(name: "2012", correctOption: false, optionTouched: false),
    //                            Option(name: "2014", correctOption: false, optionTouched: false),
    //                            Option(name: "2016", correctOption: true, optionTouched: false),
    //                            Option(name: "2020", correctOption: false, optionTouched: false)
    //                ]
    //        ),
    //
    //        Question(question: "Which Portuguese team did Ronaldo play for before signing for Manchester United?",
    //                 options: [
    //                            Option(name: "Porto", correctOption: false, optionTouched: false),
    //                            Option(name: "Benfica", correctOption: false, optionTouched: false),
    //                            Option(name: "Sporting", correctOption: true, optionTouched: false),
    //                            Option(name: "Braga", correctOption: false, optionTouched: false)
    //                ]
    //        ),
    //
    //        Question(question: "Rangers tried to sign which player after Alex McLeish was alerted to his ability through popular video game Football Manager?",
    //                 options: [
    //                             Option(name: "Neymar", correctOption: false, optionTouched: false),
    //                             Option(name: "Mbappé", correctOption: false, optionTouched: false),
    //                             Option(name: "Cristiano Ronaldo", correctOption: false, optionTouched: false),
    //                             Option(name: "Messi", correctOption: true, optionTouched: false)
    //                ]
    //        ),
    //
    //        Question(question: "Which manager has competed in the Dakar Rally?",
    //                 options: [
    //                             Option(name: "Andre Villas-Boas", correctOption: true, optionTouched: false),
    //                             Option(name: "José Mourinho", correctOption: false, optionTouched: false),
    //                             Option(name: "Carlo Ancelotti", correctOption: false, optionTouched: false),
    //                             Option(name: "Didier Deschamps", correctOption: false, optionTouched: false)
    //                    ]
    //        ),
    //
    //        Question(question: "Which footballer had a galaxy named after them in 2015?",
    //                 options: [
    //                             Option(name: "Ronaldo", correctOption: true, optionTouched: false),
    //                             Option(name: "Beckham", correctOption: false, optionTouched: false),
    //                             Option(name: "Messi", correctOption: false, optionTouched: false),
    //                             Option(name: "Ibrahimovic", correctOption: false, optionTouched: false)
    //                ]
    //        ),
    //
    //        Question(question: "Which country has won the most World Cups?",
    //                 options: [
    //                             Option(name: "France", correctOption: false, optionTouched: false),
    //                             Option(name: "England", correctOption: false, optionTouched: false),
    //                             Option(name: "Brazil", correctOption: true, optionTouched: false),
    //                             Option(name: "Germany", correctOption: false, optionTouched: false)
    //                ]
    //        )
    //    ]
    
    
    
    
    func restartRound() {
        questions.remove(at: 0)
        timeRemaining = 10
        stopTimer = false
        start = false
        optionsShow = false
        round += 1
    }
    
    func saveGame() {
        let game = Game(context: self.moc)
        game.id = self.id
        game.score = Int16(self.score)
        
        try? self.moc.save()
    }
    
    
    
    //    func newGame() {
    //        GameState.self.ObjectWillChangePublisher.
    //    }
    
    
    
    
}


