//
//  ServiceError.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

enum ServiceError: Error {
    case urlError
    case requestError
    case decodingError
    case unknownError
    
    func getMessage() -> String {
        switch self {
        case .urlError:
            return Constants.ServiceErrorMessages.urlError
        case .requestError:
            return Constants.ServiceErrorMessages.requestError
        case .decodingError:
            return Constants.ServiceErrorMessages.decodingError
        case .unknownError:
            return Constants.ServiceErrorMessages.unknownError
        }
    }
}
