//
//  RxExtensions.swift
//  Mortyverse
//
//  Created by Mugalu on 10/09/2024.
//

import Foundation
import RxSwift

extension PrimitiveSequence where Trait == SingleTrait {
    func map<R>(to value: R) -> Single<R> {
        return map { _ in value }
    }

    func map<R>(_ keyPath: KeyPath<Element, R>) -> Single<R> {
        return map { $0[keyPath: keyPath] }
    }

    func toVoid() -> Single<Void> {
        return map { _ in () }
    }

    func observeForUI() -> Single<Element> {
        return observe(on: MainScheduler.instance)
    }
}
