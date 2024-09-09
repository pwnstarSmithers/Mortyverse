//
//  NetworkingClient.swift
//  Mortyverse
//
//  Created by Mugalu on 09/09/2024.
//

import Foundation
import Moya
import RxSwift

// MARK: - API Definitions
enum RickAndMortyAPI {
    case getCharacters(page: Int)
}

// MARK: - Moya TargetType Conformance
extension RickAndMortyAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://rickandmortyapi.com/api")!
    }

    var path: String {
        switch self {
        case .getCharacters:
            return "/character"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        switch self {
        case .getCharacters(let page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }

    var sampleData: Data {
        return Data()
    }
}

// MARK: - Networking Client
class NetworkingClient {
    let provider = MoyaProvider<RickAndMortyAPI>()
    
    func getCharacters(page: Int) -> Observable<Characters> {
        return provider.rx
            .request(.getCharacters(page: page))
            .filterSuccessfulStatusCodes() // Ensure the request was successful
            .map(Characters.self)
            .asObservable()
    }
}
