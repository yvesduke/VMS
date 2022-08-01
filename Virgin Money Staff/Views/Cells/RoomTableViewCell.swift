//
//  RoomTableViewCell.swift
//  Virgin Money Staff
//
//  Created by apple on 01/07/2022.
//

import UIKit

class RoomTableViewCell: UITableViewCell {

    @IBOutlet weak var isOccupied: UILabel!
    @IBOutlet weak var maxOccupancy: UILabel!
    
    override func prepareForReuse() {
        self.isOccupied.text = ""
        self.maxOccupancy.text = ""
    }
    
    func setData(roomsElement: RoomElement) {
       isOccupied.text = "\(roomsElement.isOccupied)"
      maxOccupancy.text = "\(roomsElement.maxOccupancy)"
        
        configureAccessibility(room: roomsElement)
    }
    
    func configureAccessibility(room: RoomElement) {
        
        accessibilityElements = [maxOccupancy as Any, isOccupied as Any]
        
        maxOccupancy.accessibilityLabel = NSLocalizedString("max_ccupancies_are", comment: "")
        maxOccupancy.accessibilityValue = "\(room.maxOccupancy)"
        
        let message = room.isOccupied ?NSLocalizedString("occupied", comment: ""):NSLocalizedString("not_occupied", comment: "")
        isOccupied.accessibilityLabel = message
        
        isOccupied.accessibilityValue = ""
    }

}
