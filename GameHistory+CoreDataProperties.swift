//
//  GameHistory+CoreDataProperties.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 11/05/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//
//

import Foundation
import CoreData


extension GameHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameHistory> {
        return NSFetchRequest<GameHistory>(entityName: "GameHistory")
    }

    @NSManaged public var correctOption: Bool
    @NSManaged public var gameId: String?
    @NSManaged public var id: UUID?
    @NSManaged public var optionChosen: String?
    @NSManaged public var question: String?
    
    var wrappedGameId: String {
        gameId ?? "default"
    }
    
    var wrappedQuestion: String {
        question ?? "question"
    }
    
    var wrappedOptionChosen: String {
        optionChosen ?? "optionChosen"
    }
    
    var wrappedCorrectOption: Bool {
        correctOption
    }

}
