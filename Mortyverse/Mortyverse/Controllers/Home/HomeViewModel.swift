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

}
