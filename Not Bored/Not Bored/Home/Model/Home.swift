//
//  Home.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 23/06/22.
//

import Foundation

struct Home {
    var hasParticipants: Bool = false
    var numberOfParticipants: Int = 0 {
        didSet {
            hasParticipants = true
        }
    }
}
