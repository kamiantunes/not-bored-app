//
//  Network.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 23/06/22.
//

import Foundation
import Alamofire

final class Network {
    
    func getActivy(url: String, completion: @escaping (Activity?, Bool?) -> Void) {
        AF.request(url)
            .responseDecodable(of: Activity.self) { data in
                switch data.result {
                case .success(let activity):
                    completion(activity, false)
                case .failure(_):
                    completion(nil, true)
                }
            }
    }
    
    func makeURL(isRandom: Bool, category: String?, hasParticipants: Bool, participants: Int?, hasPrice: Bool, price: Double?) -> String {
        var url = String()
        
        if isRandom {
            if hasPrice && hasParticipants, let price = price , let participants = participants{
                url = .urlRandomParticipants + String(participants) + .parameterPrice + String(price)
            } else if hasParticipants, let participants = participants {
                url = .urlRandomParticipants + String(participants)
            } else if hasPrice, let price = price {
                url = .urlRandomPrice + String(price)
            } else {
                url = .urlRandom
            }
            
        } else if let category = category?.lowercased() {
             
            url = .urlCategorie + category
            
            if hasPrice && hasParticipants, let price = price , let participants = participants {
                url += .parameterParticipants + String(participants) + .parameterPrice + String(price)
            } else if hasParticipants, let participants = participants {
                url += .parameterParticipants + String(participants)
            } else if hasPrice, let price = price {
                url += .parameterPrice + String(price)
            }
        }
        
        return url
    }
}
