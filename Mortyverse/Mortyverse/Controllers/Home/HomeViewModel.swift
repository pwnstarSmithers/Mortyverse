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
    
    var characters: Characters?
    var charactersObservable: PublishSubject<Characters> = PublishSubject()
    
    init(count: Int) {
        getCharacters(count: count)
    }
    
    private func getCharacters(count: Int) {
        networkingClient.getCharacters(page: 20)
            .subscribe(onNext: { characters in
                self.characters = characters
                print("Characters \(characters)")
            }, onError: { error in
                print("There's an \(error)")
            })
            .disposed(by: disposeBag)
    }
}
