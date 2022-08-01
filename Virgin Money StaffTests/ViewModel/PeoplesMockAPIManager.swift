//
//  PeoplesMockAPIManager.swift
//  Virgin Money StaffTests
//
//  Created by apple on 01/08/2022.
//

import Foundation
@testable import Virgin_Money_Staff

class PeoplesMockAPIManager: APIManager {
    
    var isApiSuccessFull = true
    func call<T>(url: URL?, decoding: T.Type, completion: @escaping (Result<T, RequestErrors>) -> ()) where T : Decodable, T : Encodable {
        
        if isApiSuccessFull {
            completion(.success(ColleagueElement.mockedColleagueResponse as! T))
        }else {
            completion(.failure(RequestErrors.badData))

        }
    }
    
//    func readLocalJson(fileName: String)-> Data {
//        let bundle = Bundle(for:MockAPIManager.self)
//
//        guard let url = bundle.url(forResource:fileName, withExtension:"json"),
//              let data = try? Data(contentsOf: url)
//
//        else {
//            return Data()
//        }
//
//        return data
//    }
}


extension ColleagueElement {
    static var mockedColleagueResponse = [ColleagueElement(firstName:"Maggie", avatar:"https://randomuser.me/api/portraits/women/21.jpg", lastName:"Brekke", email:"Crystel.Nicolas61@hotmail.com", jobtitle:"Future Functionality Strategist", favouriteColor:"Pink"), ColleagueElement(firstName:"", avatar:"", lastName:"", email:"", jobtitle:"", favouriteColor:""), ColleagueElement(firstName:"", avatar:"", lastName:"", email:"", jobtitle:"", favouriteColor:"")]
}
