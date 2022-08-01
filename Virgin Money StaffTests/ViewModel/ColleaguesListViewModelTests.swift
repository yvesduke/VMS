//
//  ColleaguesListViewModelTests.swift
//  Virgin Money StaffTests
//
//  Created by apple on 01/08/2022.
//

import Foundation

import XCTest
@testable import Virgin_Money_Staff

class ColleaguesListViewModelTests: XCTestCase {

    var viewModel: ColleaguesListViewModel!
    var apiManager: PeoplesMockAPIManager!
    var vc = ColleaguesListViewController()
    
    override func setUpWithError() throws {
        apiManager = PeoplesMockAPIManager()
        viewModel = ColleaguesListViewModel(apiManager: apiManager, actionDelegate: vc)
    }

    override func tearDownWithError() throws {
  
    }
    
    
    func testGetColleguesSuccess() {
        viewModel.fetchPeople()
        
        XCTAssertEqual(viewModel.peoplesCount, 3)
        
       let people =  viewModel.getPeople(index: 0)
        XCTAssertEqual(people.firstName, "Maggie")
        
        XCTAssertEqual(people.email,  "Crystel.Nicolas61@hotmail.com")
    }
    
    func testGetColleguesFailure() {
        
        apiManager.isApiSuccessFull = false
        
        viewModel.fetchPeople()
        
        XCTAssertEqual(viewModel.peoplesCount, 0)
    
    }
    
   
}
