//
//  APIManagerTests.swift
//  Virgin Money StaffTests
//
//  Created by apple on 01/08/2022.
//

import Foundation
import XCTest
@testable import Virgin_Money_Staff

class APIManagerTests: XCTestCase {

    var networkManager: APIManager!
    var mockURLSession: MockURLSession!
    
    override func setUpWithError() throws {
        mockURLSession = MockURLSession()
        networkManager = RealAPIManager(urlSession: mockURLSession)
    }

    override func tearDownWithError() throws {
        networkManager = nil
    }
    
    // Invalid Empty request URL
    func testFailedToCreateRequestForEmptyURL() {

      networkManager.call(url:nil, decoding: ColleagueElement.self) { result in
            
            switch result {
            case .success( _):
                break
            case .failure(let error):
                XCTAssertEqual(error, RequestErrors.badURL)
            }
        }
    }
    
    // Valid Response Code - 200 but data not valid , Parsing error
    func testWhenResponseCodeIsValidButDataIdNotAsPerModel() {

        // GIVEN
        let url = URL(string:"test")
        
        mockURLSession.enqueueResponse(urlResponse: HTTPURLResponse(url:url!, statusCode: 200, httpVersion: nil, headerFields: nil)!, error: nil)

        // WHEN
        
      networkManager.call(url:url, decoding: ColleagueElement.self) { result in
            
            switch result {
            case .success( _):
                break
            case .failure(let error):
                XCTAssertEqual(error, RequestErrors.jsonParsingFailed)
            }
        }
    }

    // Invalid Response Code (not in 200 to 299 range)
    func testWhenResponseCodeIsNotSuccess() {

        // GIVEN
        let url = URL(string:"test")
        
        mockURLSession.enqueueResponse(urlResponse: HTTPURLResponse(url:url!, statusCode: 404, httpVersion: nil, headerFields: nil)!, error: nil)

        // WHEN
        
      networkManager.call(url:url, decoding: ColleagueElement.self) { result in
            
            switch result {
            case .success( _):
                break
            case .failure(let error):
                XCTAssertEqual(error, RequestErrors.badResponse)
            }
        }
    }


    // Valid Response Code but Error
    func testWhenResponseCodeIsValidButError() {

        // GIVEN

        
        // GIVEN
        let url = URL(string:"test")
        
        mockURLSession.enqueueResponse(urlResponse: HTTPURLResponse(url:url!, statusCode: 200, httpVersion: nil, headerFields: nil)!, error: RequestErrors.dataNotFound)

        

        // WHEN

        networkManager.call(url:url, decoding: ColleagueElement.self) { result in
              
              switch result {
              case .success( _):
                  break
              case .failure(let error):
                  XCTAssertEqual(error, RequestErrors.dataNotFound)
              }
          }
    }
}
