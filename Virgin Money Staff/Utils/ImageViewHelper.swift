//
//  ImageViewHelper.swift
//  Virgin Money Staff
//
//  Created by apple on 01/07/2022.
//

import Foundation
import UIKit

extension UIImageView {
    
    func getImage(from url:URL, contentMode mode: ContentMode = .scaleAspectFit) {
        
        contentMode = mode
        let session  = URLSession.shared
        let task = session.dataTask(with: url){
            data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200 else {
                return
            }
            guard let data = data, error == nil else {
                return
            }
            guard let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }
        task.resume()
    }
}
