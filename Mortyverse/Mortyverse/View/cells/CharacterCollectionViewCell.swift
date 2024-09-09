//
//  CharacterCollectionViewCell.swift
//  Mortyverse
//
//  Created by Mugalu on 07/09/2024.
//

import UIKit
import Kingfisher

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var characterNameLabel: UILabel!
    
    @IBOutlet weak var characterTypeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        characterImageView.layer.cornerRadius = characterImageView.frame.height / 2
        characterImageView.clipsToBounds = true
        
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func configure(with character: Character) {
        characterNameLabel.text = character.name
        characterTypeLabel.text = character.type
        if let imageUrl = URL(string: character.url) {
            characterImageView.kf.setImage(with: imageUrl)
        }
    }
    
}
