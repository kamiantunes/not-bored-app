//
//  Network.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 23/06/22.
//

import Foundation
import Alamofire

final class Network {
    func getActivy(url: String, completion: @escaping (Activity) -> Void) {
        AF.request(url)
            .responseDecodable(of: Activity.self) { data in
                switch data.result {
                case .success(let activity):
                    completion(activity)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
