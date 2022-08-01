//
//  RoomsViewModelTests.swift
//  Virgin Money StaffTests
//
//  Created by apple on 01/08/2022.
//

import XCTest
@testable import Virgin_Money_Staff

class RoomsViewModelTests: XCTestCase {

    var viewModel: RoomsViewModel!
    var apiManager: RoomsMockAPIManager!
    var vc = RoomsViewController()
    
    override func setUpWithError() throws {
        apiManager = RoomsMockAPIManager()
        viewModel = RoomsViewModel(apiManager: apiManager, actionDelegate: vc)
    }

    override func tearDownWithError() throws {
  
    }
    
    
    func testGetColleguesSuccess() {
        viewModel.fetchRooms()
        
        XCTAssertEqual(viewModel.roomsCount, 4)
        
        var room =  viewModel.getRoom(index: 0)
        XCTAssertEqual(room.isOccupied, false)
        
        XCTAssertEqual(room.maxOccupancy, 200)
        
        
         room =  viewModel.getRoom(index: 1)
        XCTAssertEqual(room.isOccupied, true)
        
        XCTAssertEqual(room.maxOccupancy, 300)
    }
    
    func testGetRoom() {
        viewModel.fetchRooms()
        
        
        var room =  viewModel.getRoom(index: 0)
        XCTAssertEqual(room.isOccupied, false)
        
        XCTAssertEqual(room.maxOccupancy, 200)
        
        
         room =  viewModel.getRoom(index: 1)
        XCTAssertEqual(room.isOccupied, true)
        
        XCTAssertEqual(room.maxOccupancy, 300)
    }
    
    func testGetColleguesFailure() {
        
        apiManager.isApiSuccessFull = false
        
        viewModel.fetchRooms()
        
        XCTAssertEqual(viewModel.roomsCount, 0)
    
    }
}
