//
//  Characters.swift
//  Mortyverse
//
//  Created by Mugalu on 08/09/2024.
//

import Foundation

// MARK: - Characters
struct Characters: Codable {
    let info: Info
    let results: [Character]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next, prev: String?
}

// MARK: - Character
struct Character: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}
