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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder: \(coder) has not been implemented")
    }
    
    func configure(with character: Character) {
        characterNameLabel.text = character.name
        characterTypeLabel.text = character.type
        let imageUrl = URL(string: character.url)
        characterImageView.kf.setImage(with: imageUrl)
    }
    
}
