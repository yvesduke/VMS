//
//  MockDataFetcher.swift
//  Virgin Money StaffTests
//
//  Created by apple on 02/07/2022.


import Foundation
@testable import Virgin_Money_Staff

class MockColleagueDataFetcher: FetchDataDelegate {
    
    var colleague = [ColleagueElement]()
    
    func fetchData() {
        
        let bundle = Bundle(for:Virgin_Money_StaffTests.self)
        
        guard let url = bundle.url(forResource:"PeopleResponse_success.json", withExtension:""),
              let data = try? Data(contentsOf: url)
        else {
            return
        }
        do {
            let decodedResponse = try JSONDecoder().decode([ColleagueElement].self, from: data)
            colleague = decodedResponse
        } catch {
            return
        }
    }
}



class MockRoomDataFetcher: FetchDataDelegate {
    
    var room = [RoomElement]()
    
    func fetchData() {
        let bundle = Bundle(for: Virgin_Money_StaffTests.self)
        guard let url = bundle.url(forResource: "RoomResponse_success.json", withExtension: ""),
              let data = try? Data(contentsOf: url)
        else {
            return
        }
        do {
            let decodedResponse = try JSONDecoder().decode([RoomElement].self, from: data)
            room = decodedResponse
        } catch {
            return
        }
    }
}
