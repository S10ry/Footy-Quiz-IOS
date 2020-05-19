//
//  Questions.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 04/05/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//

import Foundation

struct APIQuestion: Codable {
    //var id = UUID()
    var question: String
    var options: [APIOption]
}

struct Question: Codable {
    var id = UUID()
    var question: String
    var options: [Option]
}


