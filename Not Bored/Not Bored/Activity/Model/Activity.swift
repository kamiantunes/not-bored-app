//
//  Activity.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 23/06/22.
//

import Foundation

struct Activity : Codable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double

    var priceDescription: String {
        switch price {
        case let x where x <= 0.00:
            return "Free"
        case let x where x <= 0.30:
            return "Low"
        case let x where x <= 0.60:
            return "Medium"
        default:
            return "High"
        }
    }
}

struct ActivityInformation {
    var categorie: String?
    var homeInput: Home?
    var isRandom: Bool = false
    var url: String = String()
}
