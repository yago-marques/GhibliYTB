//
//  CardView.swift
//  ghibliYTB
//
//  Created by Yago Marques on 02/09/22.
//

import UIKit

final class CardView: UIView {
    
    private var imageNamed: String {
        didSet {
            animateTotoro()
        }
    }
    
    private lazy var ghibliImage: UIImageView = {
        let characterImage = UIImageView(frame: .zero)
        characterImage.image = UIImage(named: imageNamed)
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterImage.contentMode = .scaleAspectFit
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureModifier))
        characterImage.addGestureRecognizer(gesture)
        characterImage.isUserInteractionEnabled = true
        
        return characterImage
    }()
    
    init(imageNamed: String) {
        self.imageNamed = imageNamed
        super.init(frame: .zero)
        
        buildLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error CardView")
    }

}

private extension CardView {
    
    @objc private func tapGestureModifier() {
        if imageNamed == "totoro" || imageNamed == "umbrellaTotoro" {
            imageNamed = imageNamed == "totoro" ? "umbrellaTotoro" : "totoro"
        }
    }
    
    private func animateTotoro() {
        
        UIView.transition(
            with: ghibliImage,
            duration: 1,
            options: imageNamed == "totoro" ? .transitionFlipFromRight : .transitionFlipFromLeft,
            animations: {
                self.ghibliImage.image = UIImage(named: self.imageNamed)
            },
            completion: nil
        )
        
        UIView.animateKeyframes(withDuration: 1, delay: 0.20, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 1, animations: {
                self.ghibliImage.frame.origin.y += 20
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 1, animations: {
                self.ghibliImage.frame.origin.y -= 20
            })
            
        }, completion: nil)
        
        

    }
}

extension CardView: ViewCoding {
    func setupView() {
        self.backgroundColor = .systemBackground
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            ghibliImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ghibliImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ghibliImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            ghibliImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9)
        ])
    }
    
    func setupHierarchy() {
        self.addSubview(ghibliImage)
    }
}
