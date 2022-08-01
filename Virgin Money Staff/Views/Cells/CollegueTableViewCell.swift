//
//  CollegueTableViewCell.swift
//  Virgin Money Staff
//
//  Created by apple on 01/07/2022.
//

import UIKit

class CollegueTableViewCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var imageViewLabel: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.name.text = ""
        self.email.text = ""
        self.imageViewLabel.image = nil
    }
    
    func setData(colleague: ColleagueElement) {
        name.text = "\(colleague.firstName)"
        email.text = "\(colleague.email)"
        let PlaceholderImg = UIImage(named: "placeholder")
        imageViewLabel?.image = PlaceholderImg
        let url = URL(string: "\(colleague.avatar)")
        imageViewLabel.getImage(from: url!)
        
        configureAccessibility(colleague: colleague)
    }
    
    func configureAccessibility(colleague: ColleagueElement) {
        
        accessibilityElements = [imageViewLabel as Any , name as Any , email as Any]

        
        imageViewLabel.accessibilityLabel = NSLocalizedString("person_avatar", comment: "")
        
        name.accessibilityLabel = NSLocalizedString("name_of_person_is", comment: "")
        
        name.accessibilityValue = colleague.firstName
        
        email.accessibilityLabel = "\(colleague.firstName)'s email is"
        email.accessibilityValue = colleague.email
    }

}
