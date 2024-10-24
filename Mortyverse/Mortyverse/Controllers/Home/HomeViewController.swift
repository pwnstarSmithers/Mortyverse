//
//  HomeViewController.swift
//  Mortyverse
//
//  Created by Mugalu on 07/09/2024.
//

import UIKit
import RxSwift
import SwiftUI

class HomeViewController: UICollectionViewController {

    var viewModel: HomeViewModel?
    let disposeBag = DisposeBag()
    
    let networkingClient = NetworkingClient()
    
    var characters: Characters?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getCharacters()
    }

    private func setupView() {
        setupCollectionViewLayout()
    }

    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width - 20, height: 120)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.collectionViewLayout = layout
    }

    private func getCharacters() {
        networkingClient.getCharacters(page: 20)
            .subscribe(onNext: { characters in
                print("Fetched characters: \(characters)")  // Verify the data is being fetched
                self.characters = characters
                self.collectionView.reloadData()
            }, onError: { error in
                print("Error fetching characters: \(error)")  // Log error if there's an issue
            })
            .disposed(by: disposeBag)
    }
    
    func showDetails(for character: Character) {
        let detailsViewModel = DetailsViewModel(character: character)
        let detailsView = DetailsView(viewModel: detailsViewModel)
        let hostingController = UIHostingController(rootView: detailsView)
        //navigationController?.present(hostingController, animated: true)
        //navigationController?.pushViewController(hostingController, animated: true)
        hostingController.modalPresentationStyle = .fullScreen  // Optional for full-screen presentation
        present(hostingController, animated: true, completion: nil)
    }

    // MARK: UICollectionView DataSource methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = characters?.results.count ?? 0
        return count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCollectionViewCell", for: indexPath) as! CharacterCollectionViewCell
        if let characters = characters {
            cell.configure(with: characters.results[indexPath.row])
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerID", for: indexPath) as! HeaderCollectionReusableView
        return headerView
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         guard let characters = characters?.results, indexPath.row < characters.count else { return }
         let selectedCharacter = characters[indexPath.row]
         showDetails(for: selectedCharacter)
    }
    
    
}

extension UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.layer.bounds.size.width, height: 100)
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldSpringLoadItemAt indexPath: IndexPath, with context: any UISpringLoadedInteractionContext) -> Bool {
        return true
    }
}
