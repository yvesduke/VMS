//
//  RoomTableViewCell.swift
//  Virgin Money Staff
//
//  Created by apple on 01/07/2022.
//

import UIKit

class RoomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewLabel: UIImageView!
    @IBOutlet weak var isOccupied: UILabel!
    @IBOutlet weak var maxOccupancy: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
