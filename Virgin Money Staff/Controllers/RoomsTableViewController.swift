//
//  RoomsTableViewController.swift
//  Virgin Money Staff
//
//  Created by apple on 29/06/2022.
//

import UIKit

class RoomsTableViewController: UIViewController {
    
    @IBOutlet weak var roomTableView: UITableView!
    var room = [RoomElement]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegate()
        fetchData()
    }
    
    func setUpDelegate(){
        self.roomTableView.delegate = self
        self.roomTableView.dataSource = self
    }
}

extension RoomsTableViewController: FetchDataDelegate {
    func fetchData() {
        URLSession.shared.getRequest(url: APIEndpoints.rooms, decoding: [RoomElement].self) { result in
            switch result {
            case .success(let room):
                DispatchQueue.main.async {[weak self] in
                    self?.room = room
                    self?.roomTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension RoomsTableViewController: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return room.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RoomTableViewCell = roomTableView.dequeueReusableCell(withIdentifier: "roomCell") as!
        RoomTableViewCell
        cell.isOccupied.text = "\(room[indexPath.row].isOccupied)"
        cell.maxOccupancy.text = "\(room[indexPath.row].maxOccupancy)"
        return cell
    }
}
