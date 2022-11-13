//
//  OnboardingCollectionViewCell.swift
//  tabBarPractice
//
//  Created by Batuhan Demircioğlu on 10.11.2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    

    @IBOutlet weak var slideDescription: UILabel!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescription.text = slide.description
    }
}
