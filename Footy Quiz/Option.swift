//
//  Option.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 07/05/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//

import Foundation


struct APIOption: Codable {
    //var id = UUID()
    var name: String
    var correctOption: Bool
    var optionTouched: Bool? = true
}

struct Option: Codable {
    var id = UUID()
    var name: String
    var correctOption: Bool
    var optionTouched:Bool
    
    mutating func touched() {
        optionTouched = true
    }
}
