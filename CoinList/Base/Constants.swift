//
//  Constants.swift
//  CoinList
//
//  Created by Leonardo Saganski on 17/02/25.
//

import Foundation

struct Constants {
    struct URL {
        static let baseUrl = "https://rest.coinapi.io/v1"
        static let listExchanges = "/exchanges"
        static let apiKey = "defcd609-5dc3-477f-9fb0-ebe493b8987b"
    }
    
    struct ServiceErrorMessages {
        static let urlError = "Failed at processing URL"
        static let requestError = "Failed at API request"
        static let decodingError = "Failed at decoding response data"
        static let unknownError = "We got an error."
    }
    
    static let urlMock = ["/exchanges": "ExchangeMock"]
    
    struct String {
        static let scheduleDay = "%1$@ (%2$d min)"
        static let scheduleDayTime = "%1$@ at %2$@ (%3$d min)"
        static let ended = "Ended"
        static let running = "Running"
        static let episodes = "Episodes"
        static let shows = "Shows"
        static let season = "Season %d"
        static let pinKey = "TMZPINKEY"
        static let authFaceId = "AuthFaceId"
    }
    
    struct Images {
        static let back = "chevron.left"
        static let search = "search"
    }
    
    struct Testing {
        static let exchangeList = "EXCHANGE_LIST"
        static let exchangeName = "EXCHANGE_NAME"
    }
}
