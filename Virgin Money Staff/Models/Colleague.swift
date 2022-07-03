//
//  Colleague.swift
//  Virgin Money Staff
//
//  Created by apple on 29/06/2022.
//

import Foundation


struct ColleagueElement: Codable {
    let createdAt: String
    let firstName: String
    let avatar: String
    let lastName: String
    let email: String
    let jobtitle: String
    let favouriteColor: String
    let id: String
    let data: DataClass?
    let to: String?
    let fromName: String?

    enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case firstName = "firstName"
        case avatar = "avatar"
        case lastName = "lastName"
        case email = "email"
        case jobtitle = "jobtitle"
        case favouriteColor = "favouriteColor"
        case id = "id"
        case data = "data"
        case to = "to"
        case fromName = "fromName"
    }
}

struct DataClass: Codable {
    let title: String
    let body: String
    let id: String
    let toID: String
    let fromID: String
    let meetingid: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case body = "body"
        case id = "id"
        case toID = "toId"
        case fromID = "fromId"
        case meetingid = "meetingid"
    }
}
