//
//  RoomsMockAPIManager.swift
//  Virgin Money StaffTests
//
//  Created by apple on 01/08/2022.
//

import Foundation
@testable import Virgin_Money_Staff

class RoomsMockAPIManager: APIManager {
    
    var isApiSuccessFull = true
    
    func call<T>(url: URL?, decoding: T.Type, completion: @escaping (Result<T, RequestErrors>) -> ()) where T : Decodable, T : Encodable {
        
        if isApiSuccessFull {
            completion(.success(RoomElement.mockedRoomsResponse as! T))
        }else {
            completion(.failure(RequestErrors.badData))

        }
    }
}


extension RoomElement {
    static var mockedRoomsResponse = [RoomElement(createdAt:"", isOccupied: false, maxOccupancy:200, id: "1"), RoomElement(createdAt:"", isOccupied: true, maxOccupancy:300, id: "2"), RoomElement(createdAt:"", isOccupied: false, maxOccupancy:400, id: "3"), RoomElement(createdAt:"", isOccupied: false, maxOccupancy:500, id: "4")]
}
