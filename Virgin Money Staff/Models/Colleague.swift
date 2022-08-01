//
//  Colleague.swift
//  Virgin Money Staff
//
//  Created by apple on 29/06/2022.
//

import Foundation

struct ColleagueElement: Codable {
    
    let firstName: String
    let avatar: String
    let lastName: String
    let email: String
    let jobtitle: String
    let favouriteColor: String

    enum CodingKeys: String, CodingKey {
        case firstName = "firstName"
        case avatar = "avatar"
        case lastName = "lastName"
        case email = "email"
        case jobtitle = "jobtitle"
        case favouriteColor = "favouriteColor"
    }
}
