//
//  AnimationViewController.swift
//  ghibliYTB
//
//  Created by Yago Marques on 02/09/22.
//

import UIKit

final class AnimationViewController: UIViewController {
    
    private lazy var totoroImage: CardView = {
        let card = CardView(imageNamed: "totoro")
        card.translatesAutoresizingMaskIntoConstraints = false
        
        return card
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildLayout()
    }
    
}

extension AnimationViewController: ViewCoding {
    func setupView() {
        view.addBackgound()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            totoroImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            totoroImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            totoroImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            totoroImage.heightAnchor.constraint(equalTo: totoroImage.widthAnchor),
        ])
    }
    
    func setupHierarchy() {
        view.addSubview(totoroImage)
    }
    
    
}





