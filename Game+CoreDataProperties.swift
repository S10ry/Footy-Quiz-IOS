//
//  Game+CoreDataProperties.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 11/05/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var id: String?
    @NSManaged public var score: Int16
    @NSManaged public var history: NSSet?

}

// MARK: Generated accessors for history
extension Game {

    @objc(addHistoryObject:)
    @NSManaged public func addToHistory(_ value: GameHistory)

    @objc(removeHistoryObject:)
    @NSManaged public func removeFromHistory(_ value: GameHistory)

    @objc(addHistory:)
    @NSManaged public func addToHistory(_ values: NSSet)

    @objc(removeHistory:)
    @NSManaged public func removeFromHistory(_ values: NSSet)

}
