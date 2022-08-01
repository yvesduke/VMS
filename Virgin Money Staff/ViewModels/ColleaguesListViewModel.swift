//
//  ColleaguesListViewModel.swift
//  Virgin Money Staff
//
//  Created by apple on 01/08/2022.
//

import Foundation

protocol ColleaguesListViewModelInput {
    func fetchPeople()
}

protocol ColleaguesListViewModelOutput {
    var peoplesCount: Int {get}
    func getPeople(index: Int)-> ColleagueElement
}

final class ColleaguesListViewModel: ColleaguesListViewModelInput, ColleaguesListViewModelOutput  {

    private var colleagues = [ColleagueElement]()
    private var apiManager: APIManager
    
    private weak var actionDelegate: ListViewModelAction?

    var peoplesCount: Int {
        return colleagues.count
    }
    
    init(apiManager: APIManager, actionDelegate: ListViewModelAction) {
        self.apiManager = apiManager
        self.actionDelegate = actionDelegate
    }
    
    func fetchPeople() {
        apiManager.call(url: APIEndpoints.people, decoding: [ColleagueElement].self) {[weak self] result in
            switch result {
            case .success(let colleague):
                self?.colleagues = colleague
                self?.actionDelegate?.refreshUI()
            case .failure(_):
                self?.colleagues = []
            }
        }
    }
    
    func getPeople(index: Int)-> ColleagueElement {
      return colleagues[index]
    }
}
