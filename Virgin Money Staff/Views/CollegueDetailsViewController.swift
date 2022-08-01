//
//  CollegueDetailsViewController.swift
//  Virgin Money Staff
//
//  Created by apple on 29/06/2022.
//

import UIKit

class CollegueDetailsViewController: UIViewController {

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var favouriteColor: UILabel!
    @IBOutlet weak var imageViewLabel: UIImageView!
    
    var colleague: ColleagueElement?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstName.text = colleague?.firstName
        lastName.text = colleague?.lastName
        email.text = colleague?.email
        jobTitle.text = colleague?.jobtitle
        favouriteColor.text = colleague?.favouriteColor
        if let url = URL(string: colleague?.avatar ?? "") {
            imageViewLabel.getImage(from: url)
        }
    }

}
