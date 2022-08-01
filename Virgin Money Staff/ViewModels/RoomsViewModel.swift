//
//  RoomsViewModel.swift
//  Virgin Money Staff
//
//  Created by apple on 01/08/2022.
//

import Foundation


protocol RoomsViewModelInput {
    func fetchRooms()
}

protocol RoomsViewModelOutput {
    var  roomsCount: Int {get}
    func getRoom(index: Int)-> RoomElement
}

final class RoomsViewModel: RoomsViewModelInput, RoomsViewModelOutput  {

    private var rooms = [RoomElement]()
    private var apiManager: APIManager
    
    private weak var actionDelegate: ListViewModelAction?

    var roomsCount: Int {
        return rooms.count
    }
    
    init(apiManager: APIManager, actionDelegate: ListViewModelAction) {
        self.apiManager = apiManager
        self.actionDelegate = actionDelegate
    }
    
    func fetchRooms() {
        apiManager.call(url: APIEndpoints.rooms, decoding: [RoomElement].self) {[weak self] result in
            switch result {
            case .success(let rooms):
                self?.rooms = rooms
                self?.actionDelegate?.refreshUI()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getRoom(index: Int)-> RoomElement {
      return rooms[index]
    }
}
