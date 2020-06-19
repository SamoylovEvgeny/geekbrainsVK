//
//  FriendsLoader.swift
//  L1_Samoylov_Evgeny
//
//  Created by Evgen on 24.05.2020.
//  Copyright © 2020 XXX. All rights reserved.
//

import UIKit
import Alamofire

struct FriendsJson: Codable {
    var response: Response
}
struct Response: Codable {
    var items: [Item]
}

struct Item: Codable {
    var firstName: String
    var lastName: String
    var avatar: String
    var id: Int
    
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "photo_50"
        case id = "id"
    }
}
class FriendsLoader {
    func loadFriendsData(completion: @escaping ([Item]) -> Void ){
        let parameters : Parameters = [
            "user_id" : Session.instance.userId,
            "access_token" : Session.instance.token,
            "order" : "name",
            "fields" : "photo_50",
            "v" : "5.103"
            ]
        
        AF.request("https://api.vk.com/method/friends.get", parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            
            do {
                let users = try JSONDecoder().decode(FriendsJson.self, from: data).response.items
                completion(users)
                print(users)
            } catch {
                print(error)
            }
            
        }
}
}
