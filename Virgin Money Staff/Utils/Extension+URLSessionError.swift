//
//  Extension+URLSessionError.swift
//  Virgin Money Staff
//
//  Created by apple on 29/06/2022.
//

import Foundation

extension URLSession {
    enum RequestErrors: Error {
        case badURL
        case badData
    }
}
