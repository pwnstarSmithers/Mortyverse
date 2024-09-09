//
//  HomeViewModel.swift
//  Mortyverse
//
//  Created by Mugalu on 09/09/2024.
//

import Foundation
import RxSwift

final class HomeViewModel {
    // MARK: - Properties
    
    let networkingClient = NetworkingClient()
    let disposeBag = DisposeBag()
    
    var characters = [Characters]()
    
    init(characters: [Characters] = [Characters]()) {
        self.characters = characters
        getCharacters(count: 20)
    }
    
    private func getCharacters(count: Int) {
        networkingClient.getCharacters(page: 20)
            .subscribe(onNext: { character in
                print("Characters \(character)")
            }, onError: { error in
                print("There's an \(error)")
            })
            .disposed(by: disposeBag)
    }
}
