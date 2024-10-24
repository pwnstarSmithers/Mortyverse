//
//  DetailsViewModel.swift
//  Mortyverse
//
//  Created by Mugalu on 24/10/2024.
//

import Foundation
import RxSwift

class DetailsViewModel: ObservableObject {
    // MARK: - Properties
    private let disposeBag = DisposeBag()
    private let networkingClient = NetworkingClient()
    
    @Published var character: Character?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    // Initializer accepting a character or character ID
    init(character: Character? = nil) {
        if let character = character {
            self.character = character
        }
    }

    // Fetch details from API if necessary
    func fetchCharacterDetails(id: Int) {
        isLoading = true
        networkingClient.getCharacterDetails(id: id)
            .subscribe(onNext: { [weak self] character in
                self?.character = character
                self?.isLoading = false
            }, onError: { [weak self] error in
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            })
            .disposed(by: disposeBag)
    }
}
