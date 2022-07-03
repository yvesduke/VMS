//
//  Virgin_Money_StaffTests.swift
//  Virgin Money StaffTests
//
//  Created by apple on 29/06/2022.
//

import XCTest
@testable import Virgin_Money_Staff

class Virgin_Money_StaffTests: XCTestCase {
    
    let mockColleagueDataFetcher = MockColleagueDataFetcher()
    let mockRoomDataFetcher = MockRoomDataFetcher()
    
    func testFetchPeople(){
        XCTAssertEqual(mockColleagueDataFetcher.colleague.count, 0)
        mockColleagueDataFetcher.fetchData()
        XCTAssertEqual(mockColleagueDataFetcher.colleague.count, 69)
        XCTAssertEqual(mockColleagueDataFetcher.colleague[3].firstName, "Gunnar")
    }
    
    func testFetchRoom(){
        XCTAssertEqual(mockRoomDataFetcher.room.count, 0)
        mockRoomDataFetcher.fetchData()
        XCTAssertEqual(mockRoomDataFetcher.room.count, 65)
        XCTAssertEqual(mockRoomDataFetcher.room[3].isOccupied, false)
    }

}
