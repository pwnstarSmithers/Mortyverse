//
//  HomeViewController.swift
//  Mortyverse
//
//  Created by Mugalu on 07/09/2024.
//

import UIKit

class HomeViewController: UICollectionViewController {
    
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupView() {
        self.collectionView.register(UINib(nibName: "CharacterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CharacterCollectionViewCell")
        setupCollectionViewLayout()
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width - 20, height: 120)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.collectionViewLayout = layout
    }
    
    // MARK: UICollectionView DataSource methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.characters?.results.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCollectionViewCell", for: indexPath) as! CharacterCollectionViewCell
        if let characters = viewModel?.characters {
            cell.configure(with: characters.results[indexPath.row])
        }
        return cell
    }
}
