//
//  View.swift
//  ghibliYTB
//
//  Created by Yago Marques on 02/09/22.
//

import UIKit

extension UIView {
    func addBackgound() {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let background = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        background.image = UIImage(named: "background")
        background.contentMode = .scaleAspectFill
        
        self.addSubview(background)
        self.sendSubviewToBack(background)
    }
}
