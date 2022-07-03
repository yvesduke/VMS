//
//  ColleaguesViewController.swift
//  Virgin Money Staff
//
//  Created by apple on 29/06/2022.
//

import UIKit
import Foundation

class ColleaguesListViewController: UIViewController {
    
    @IBOutlet weak var colleagueTableView: UITableView!
    
    var colleague = [ColleagueElement]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setUpDelegates()
    }
    
    func setUpDelegates() {
        colleagueTableView.delegate = self
        colleagueTableView.dataSource = self
    }
}

extension ColleaguesListViewController: FetchDataDelegate {
    func fetchData() {
        URLSession.shared.getRequest(url: APIEndpoints.people, decoding: [ColleagueElement].self) { result in
            switch result {
            case .success(let colleague):
                DispatchQueue.main.async { [weak self] in
                    self?.colleague = colleague
                    self?.colleagueTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ColleaguesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of rows In Section: \(colleague.count)")
        return colleague.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CollegueTableViewCell = colleagueTableView.dequeueReusableCell(withIdentifier: "collegueCell") as!
        CollegueTableViewCell
        cell.name.text = "\(colleague[indexPath.row].firstName)"
        cell.email.text = "\(colleague[indexPath.row].email)"
        let PlaceholderImg = UIImage(named: "placeholder")
        cell.imageViewLabel?.image = PlaceholderImg
        let url = URL(string: "\(colleague[indexPath.row].avatar)")
        cell.imageViewLabel.getImage(from: url!)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CollegueDetailsViewController {
            destination.colleague = colleague[(colleagueTableView.indexPathForSelectedRow?.row)!]
        }
    }
}

