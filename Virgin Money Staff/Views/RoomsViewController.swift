//
//  RoomsTableViewController.swift
//  Virgin Money Staff
//
//  Created by apple on 29/06/2022.
//

import UIKit

class RoomsViewController: UIViewController {
    
    @IBOutlet weak var roomTableView: UITableView!
    
    private var viewModel:RoomsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel =  RoomsViewModel(apiManager: RealAPIManager(), actionDelegate: self)
        viewModel.fetchRooms()
        setUpDelegate()
    }
    
    private func setUpDelegate(){
        self.roomTableView.delegate = self
        self.roomTableView.dataSource = self
    }
}

extension RoomsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.roomsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RoomTableViewCell = roomTableView.dequeueReusableCell(withIdentifier: "roomCell") as!
        RoomTableViewCell
        
        let room = viewModel.getRoom(index: indexPath.row)
      
        cell.setData(roomsElement: room)
        return cell
    }
}

extension RoomsViewController: ListViewModelAction {
    func refreshUI() {
        DispatchQueue.main.async {
            self.roomTableView?.reloadData()
        }
    }
}
